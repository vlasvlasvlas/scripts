with dupe as ( 
SELECT 

*,
jsonb_array_elements(pois->'results') as pois_results

FROM public.cities
where cntry_name in 
('Brazil','Australia','Canada','United Kingdom')
)

select 
	*,
	pois_results->>'id' as poi_id,
	pois_results->>'href' as poi_href,
	pois_results->>'type' as poi_type,
	pois_results->>'title' as poi_title,
	pois_results->>'category' as poi_category,
	pois_results->>'distance' as poi_distance,
	pois_results->>'position' as poi_position,
	pois_results->>'vicinity' as poi_vicinity,
	pois_results->>'resultType' as poi_resultType,
	pois_results->>'completion' as poi_completion,
	pois_results->>'categoryTitle' as poi_categoryTitle,
	pois_results->>'highlightedTitle' as poi_highlightedTitle,
	pois_results->>'highlightedVicinity' as poi_highlightedVicinity
from dupe 
