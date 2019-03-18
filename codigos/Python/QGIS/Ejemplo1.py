#################################################################################################
# Autor: josego85@gmail.com
# Blog: www.proyectosbeta.net
# Fecha de creacion: 17 de marzo de 2019 a las 20:22 hs.
# Fecha de actualizacion: 17 de marzo de 2019 a las 22:04 hs.
#
# Ejemplo 1:
# - Agrega un shp de departamentos de Paraguay
# - Se agrega simbologia utilizando:
#   - Se coloca etiqueta Nombre
#################################################################################################
layer = QgsVectorLayer(r"/home/proyectosbeta/Escritorio/Shp/Paraguay/Departamentos/Departamentos.shp", "Departamentos")
if layer.isValid():
    # Agregar un shape a la interfaz QGIS.
    QgsProject.instance().addMapLayer(layer)

    # Agrega simbologia etiquetando nombre por departamento.
    layer_settings  = QgsPalLayerSettings()
    text_format = QgsTextFormat()
    background_color = QgsTextBackgroundSettings()

    background_color.setFillColor(QColor('white'))
    background_color.setEnabled(True)

    text_format.setFont(QFont("Arial", 8))
    text_format.setSize(8)
    text_format.setBackground(background_color )

    buffer_settings = QgsTextBufferSettings()
    buffer_settings.setEnabled(True)
    buffer_settings.setSize(0.10)
    buffer_settings.setColor(QColor("black"))

    text_format.setBuffer(buffer_settings)
    layer_settings.setFormat(text_format)

    layer_settings.fieldName = "Nombre"
    layer_settings.placement = 4

    layer_settings.enabled = True

    layer_settings = QgsVectorLayerSimpleLabeling(layer_settings)
    layer.setLabelsEnabled(True)
    layer.setLabeling(layer_settings)
    layer.triggerRepaint()
