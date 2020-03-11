#! usr/bin/env python

from sys import argv
from os.path import exists
import simplejson as json 

script, in_file, out_file = argv
data = json.load(open(in_file))

geojson = {
    "type": "FeatureCollection",
    "features": [
    {
        "type": "Feature",
        "geometry": {
            "type": "Point",
            "coordinates": [float(d["lon"]), float(d["lat"])]
        },
	"properties": { 
	    key: value 
            for key, value in d.items()
            	if key not in ('lon','lat','foto','audio_guarani','audio_espanol','tipo_sede','nombre_circunscripcion','nombre_localidad','codigo_sede','codigo_localidad','numero_circunscripcion') 
	}
     } for d in data]
}

output = open(out_file, 'w')
json.dump(geojson, output)
