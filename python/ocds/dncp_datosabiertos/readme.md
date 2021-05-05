
## Descarga de Datasets correspondiente a licitaciones
* Correr pip install -r requirements.txt
* Descargar los archivos 2010/2021 de https://www.contrataciones.gov.py/datos/licitaciones
* descomprimir cada "masivo.zip" en carpetas nombradas por el año
<img src="https://user-images.githubusercontent.com/4071796/117094722-e82e7800-ad3a-11eb-9706-a0788540db49.png" height="200">

* correr exploratorio1_appendAnios.py
* se generaran los archivos csv masivos acumulando total años para 'records','ten_items','ten_lots','ten_notifiedSuppliers','contracts' en la carpeta /outs
<img src="https://user-images.githubusercontent.com/4071796/117095115-db5e5400-ad3b-11eb-8be4-14563a45f86c.png" height="200">
* ejecutar exploratorio2_SalidaDataProfile.py para generar los archivos .html de pandas profile
