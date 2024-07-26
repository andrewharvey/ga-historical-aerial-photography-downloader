data/HAP_Photo_Centres_AGOL.geojson:
	mkdir -p data
	esri2geojson --paginate-oid 'https://services1.arcgis.com/wfNKYeHsOyaFyPw3/arcgis/rest/services/HistoricalAerialPhotography_AGOL_DIST_gdb/FeatureServer/0' $@

data/HAP_Flight_Lines_AGOL.geojson:
	mkdir -p data
	esri2geojson --paginate-oid 'https://services1.arcgis.com/wfNKYeHsOyaFyPw3/arcgis/rest/services/HistoricalAerialPhotography_AGOL_DIST_gdb/FeatureServer/1' $@

data/HAP_Photo_Centres_AGOL.fgb: data/HAP_Photo_Centres_AGOL.geojson
	ogr2ogr -f FlatGeobuf $@ $<

data/HAP_Flight_Lines_AGOL.fgb: data/HAP_Flight_Lines_AGOL.geojson
	ogr2ogr -f FlatGeobuf $@ $<
