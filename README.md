# ProyectosBeta
En el directorio scripts/LibreOffice se encuentra lo siguiente:
* instalarLibreOffice5_0_3__64bits.sh: script para descargar e instalar LibreOffice 5.0.3 en Debian Jessie de 64 bits.
* instalarLibreOffice5_0_4__64bits.sh: script para descargar e instalar LibreOffice 5.0.4 en Debian Jessie de 64 bits. 
* instalarLibreOffice_5_1_0_64bits.sh: script para descargar e instalar LibreOffice 5.1.0 en Debian Jessie de 64 bits.
* instalarLibreOffice5.1.0_fedora23_64its.sh: script para descargar e instalar LibreOffice 5.1.0 en Fedora 23 de 64 bits.


En el directorio scripts/GNU_Linux/bash/ se encuentra lo siguiente:
* limpiarMemoriaSwap.sh: script para limpiar la memoria Swap de cualquier distro GNU/Linux. Este script pasa la memoria Swap a la memoria RAM, liberanbdo por totalidad la memoria Swap.

En el directorio GIS/Leaflet se encuentra lo siguiente:
* Leaflet_wikimediamaps.zip: Se utiliza Leftlet (0.75) y muestra el mapa de la wikimedia. [Demo](http://proyectosbeta.net/Labs/Leaflet_wikimediamaps/src/).

En el directorio GIS/OL3 se encuentra lo siguiente:
* UsandoMarcadoresOL3.zip: Se utiliza OL3 (v.3.6.0) y muestra varios marcadores en un mapa. [Demo](http://proyectosbeta.net/Labs/UsandoMarcadoresOL3/fuentes/).
* OL3VariosMarcadores.zip: Se utiliza OL3 (v.3.8.2) y muestra varios marcadores en un mapa. Es otra forma mucho mejor usando el layer vector, estilos y usando el formato GeoJSON. [Demo](http://proyectosbeta.net/Labs/OL3VariosMarcadores/fuentes/).

En el directorio GIS/Mapbox se encuentra lo siguiente:
* EjemploMapbox: Utiliza la librería mapbox con un plugin de leaflet para mostrar un ejemplo de un mapa de calor. [Demo](http://proyectosbeta.net/Labs/EjemploMapbox/src/).

En el directorio GIS/OSM se encuentra lo siguiente:
* departamentosParaguay.sh: Un script que descarga los datos OSM de Paraguay del sitio GeoFabrik y crea archivos OSM separados por cada departamento. 17 departamentos

En el directorio GIS/SHP se encuentra lo siguiente:
* Departamentos de Paraguay.zip: Se encuentra un archivo comprimido sobre todos los departamentos de Paraguay en un solo shp.
* Asuncion.zip: Se encuentra un archivo comprimido sobre Asunci%oacute;n (Capital de Paraguay).
* Shp Asuncion.zip: Se encuentra un archivo comprimido para obtener el poligono de Asunci%oacute;n (Capital de Paraguay). Se usan dos poligonos de dos Departamentos que estan alrededor de Asunci&oacute;n. Luego dos shps mas para determinar Asunci&oacute;n.


En el directorio GIS/SQL se encuentra lo siguiente:
* departamentosParaguay.sql: Es un archivo sql donde estan todos los departamentos de Paraguay. Se necesita tener una base de datos espacial (PostgreSQL/PostGIS) para poder ejecutar el script.
* DepartamentosParaguay_MySQL5.6.zip: Son dos archivos sql donde estan todos los 17 departamentos de Paraguay. Un archivo crea la tabla de los 17 departamentos y la otra es para insertar los departamentos. Se usa MySQL 5.6 porque soporte datos geograficos. La sentencia para determinar el departamento de un punto de Paraguay es: SELECT departamento_nombre FROM departamentos WHERE ST_CONTAINS(geom, POINT(-57.03342,-23.16547));
