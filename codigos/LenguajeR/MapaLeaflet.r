# Se debe tener estos pquetes instalados en tu distro.
# Se probo en Debian Jessie y en Ubuntu 16.04 LTS de 64 bits.
# sudo aptitude update
#sudo aptitude install libc-bin proj-bin libgdal1-dev libproj-dev

# Instalar paquetes.
#install.packages("leaflet")
#install.packages("raster")
#install.packages("rgdal")

# Cargar librerias
library(sp)
library(raster)
library(leaflet)
library(rgdal)

# Cargar shp de ejemplo.
departamentos <- shapefile("/home/proyectosbeta/DepartamentosParaguay/TodosDepartamentos.shp")

#Usamos Leaflet:
leaflet(data = departamentos) %>% addTiles() %>% addPolygons(fill = FALSE, stroke = TRUE, color = "#03F") %>% addLegend("bottomright", colors = "#03F", labels = "Departamentos Paraguay")