import requests, simplejson as json, sys, pandas as pd, time

def safeget(dct, *keys):
    for key in keys:
        try:
            dct = dct[key]
        except KeyError:
            return None
    return dct

urlCovid19 = 'https://contrataciones.gov.py/datos/api/v3/doc/search/processes?tender.procurementMethodRationale=covid-19&page=1&items_per_page=1000'
response = requests.get(urlCovid19)
records = json.loads(response.text)['records']
rows_list = []
df = pd.DataFrame()

for record in records:
    
    print(str(records.index(record)+1)+"/"+str(len(records)))
    urlRelease = record['releases'][0]['url']
    responseRelease = requests.get(urlRelease)
    recordsRelease = json.loads(responseRelease.text)['releases'][0]

    newrow = {

        # Processes - Records
        "rowid":records.index(record),
        "rec_url":urlCovid19,
        "rec_compiledRelease_ocid":safeget(record, 'compiledRelease', 'ocid'),
        "rec_compiledRelease_date":safeget(record, 'compiledRelease', 'date'),
        "rec_compiledRelease_tender_id":safeget(record, 'compiledRelease', 'tender', 'id'),
        "rec_compiledRelease_tender_title":safeget(record, 'compiledRelease', 'tender', 'title'),
        "rec_compiledRelease_tender_procuringEntity_name":safeget(record, 'compiledRelease', 'tender', 'procuringEntity','name'),
        "rec_compiledRelease_tender_mainProcurementCategoryDetails":safeget(record, 'compiledRelease', 'tender', 'mainProcurementCategoryDetails'),
        "rec_compiledRelease_tender_statusDetails":safeget(record, 'compiledRelease', 'tender', 'statusDetails'),
        "rec_compiledRelease_tender_procuringEntity_name":safeget(record, 'compiledRelease', 'tender', 'procuringEntity','name'),
        "rec_compiledRelease_tender_procuringEntity_id":safeget(record, 'compiledRelease', 'tender', 'procuringEntity','id'),
        "rec_compiledRelease_tender_procurementMethodDetails":safeget(record, 'compiledRelease', 'tender', 'id'),
        "rec_compiledRelease_tender_id_tenderPeriod_durationInDays":safeget(record, 'compiledRelease', 'tender', 'tenderPeriod','durationInDays'),
        "rec_compiledRelease_tender_id_tenderPeriod_startDate":safeget(record, 'compiledRelease', 'tender', 'tenderPeriod','startDate'),
        "rec_compiledRelease_tender_id_tenderPeriod_endDate":safeget(record, 'compiledRelease', 'tender', 'tenderPeriod','endDate'),
        
        # Processes - Records - Release
        "recrel_url":record['releases'][0]['url'],
        "recrel_id":record['releases'][0]['url'],
        "recrel_tender_id":safeget(recordsRelease, 'tender', 'id'),
        "recrel_tender_statusDetails":safeget(recordsRelease, 'tender', 'statusDetails'),
        "recrel_tender_awardCriteria":safeget(recordsRelease, 'tender', 'awardCriteria'),
        "recrel_tender_awardCriteriaDetails":safeget(recordsRelease, 'tender', 'awardCriteriaDetails'),
        "recrel_tender_mainProcurementCategory":safeget(recordsRelease, 'tender', 'mainProcurementCategory'),
        "recrel_tender_mainProcurementCategoryDetails":safeget(recordsRelease, 'tender', 'mainProcurementCategoryDetails'),
        "recrel_tender_additionalProcurementCategories":safeget(recordsRelease, 'tender', 'additionalProcurementCategories',0),
        "recrel_tender_hasEnquiries":safeget(recordsRelease, 'tender', 'hasEnquiries'),
        "recrel_tender_value_amount":safeget(recordsRelease, 'tender', 'value','amount'),
        "recrel_tender_value_currency":safeget(recordsRelease, 'tender', 'value','currency'),
        "recrel_tender_awardPeriod_startDate":safeget(recordsRelease, 'tender', 'awardPeriod','startDate'),
        "recrel_tender_procuringEntity_id":safeget(recordsRelease, 'tender', 'procuringEntity','id'),
        "recrel_tender_procuringEntity_name":safeget(recordsRelease, 'tender', 'procuringEntity','name')

    }

    rows_list.append(newrow)
    time.sleep(1)

df = pd.DataFrame(rows_list)   
df.to_csv('output.csv',index=False,encoding ='latin1')
