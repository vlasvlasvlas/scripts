<?php
/*
Desc: script para tomar puntos filtrados de seeclickfix. 
Seeclickfix: SeeClickFix encouraging residents to become active citizens in taking care
             of and improving their city by reporting non-emergency issue in their neighborhood.
             Web para reportar problemas sociales urbanos con puntos geo y atributos asociados.
Objetivo: generar como salida un geojson libre para ser usado como quieran.
Ej uso: 
       geojson_seeclickfix.php?tipo=corte&lugar=arg

*/

$search = $_GET['tipo'];
$place_url = $_GET['lugar'];
$url = 'http://seeclickfix.com/api/v2/issues?search='.$search.'&place_url='.$place_url;
$json_data = file_get_contents($url);

$json = json_decode($json_data, true);


$json_cant = count($json['issues']);


$puntos ='';

// se puede sumar más elementos para properties.

for ($i = 0; $i <= $json_cant; $i++) {
  if ($json['issues'][$i]['lng'] == '') {} else {

    $desc = str_replace(':','',$json['issues'][$i]['description']);
    $desc = str_replace('"','',$desc);

    $puntos .= '{"geometry": {"type": "Point", "coordinates": [';
    $puntos .= $json['issues'][$i]['lng'].','.$json['issues'][$i]['lat'];
    $puntos .= ']}, "type": "Feature", "id": 0, "properties": {';
    $puntos .=  '"Nombre": "'.$json['issues'][$i]['summary'].'",';
    $puntos .=  '"Descripción": "'.$desc.'",';
    $puntos .=  '"Dirección": "'.$json['issues'][$i]['address'].'",';
    $puntos .=  '"URL": "<a href=\''.$json['issues'][$i]['html_url'].'\' target=\'_blank\'>Acceder</a>"';
    $puntos .=  '}},';
  }
}
$puntos = rtrim($puntos, ',');
$puntos = str_replace('#','',$puntos);
$puntos = preg_replace( "/\r|\n/", "", $puntos );

echo '{"type":"FeatureCollection","features":['.$puntos.']}';

?>
