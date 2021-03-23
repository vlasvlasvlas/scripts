import xlrd
import msoffcrypto

def handle_protected_workbook(wb_filepath):
    try:
        _book = xlrd.open_workbook(wb_filepath)
    except xlrd.biffh.XLRDError, e:
        if e.message == "Workbook is encrypted":
            # Try and unencrypt workbook with magic password
            wb_msoffcrypto_file = msoffcrypto.OfficeFile(open(wb_filepath, 'rb'))
            try:
                # Yes, this is actually a thing
                # https://nakedsecurity.sophos.com/2013/04/11/password-excel-velvet-sweatshop/
                wb_msoffcrypto_file.load_key(password='VelvetSweatshop')
            except AssertionError, e:
                if e.message == "Failed to verify password":
                    # Encrypted with some other password
                    raise # or do something else
                else:
                    # Some other error occurred
                    raise
            except:
                # Some other error occurred
                raise
            else:
                # Magic Excel password worked

                assert wb_filepath.endswith('.xls')
                wb_unencrypted_filename = wb_filepath[:-(len('.xls'))] + '__unencrypted.xls'

                with tempfile.NamedTemporaryFile() as tmp_wb_unencrypted_file:
                    # Decrypt into the tempfile
                    wb_msoffcrypto_file.decrypt(tmp_wb_unencrypted_file)
                    # --- Do something with the file ---
                # return true to indicate file was touched
                return True  # or do something else
        else:
            # some other xlrd error occurred.
            return False  # or do something else
    except:
        # some non-xlrd error occurred.
        return False  # or do something else
