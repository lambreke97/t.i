Importante para reproducir se necesita la libreria minim, el mismo processing la tiene incluida pero no esta completa
el link para descargar la libreria completa es el siguiente: "http://code.compartmental.net/tools/minim/" (descargen la version full),
despues de cargarla la deben colocar en la siguiente ruta "/usr/local/processing/<carpetaprocessing ej 1.1>/modes/java/librerias"
ahi se encuentra la carpeta minim incompleta que trae por defecto processing.

Luego en la carpeta del proyecto crean otra carpeta llamada date en la cual colocaran el archivo de audio a reproducir.

Luego en el codigo en la la parte donde dice  MySong = AudioManager.loadFile("<nombrearchivo>.mp3");
colocan el nombre del archivo de audio en la carpeta data. 
