Air-Drum
=======

Air-Drum

Claudio Acuña, Cristián Garrido, Guillermo Rojas.

Resumen

La batería virtual es una software que consiste permitir al usuario poder tocar una batería mediante el uso de un pc y herramientas adicionales (kinect y arduino) para poder emularla y darle la sensación al usuario de poder estar tocar una real, sin la necesidad de gastar tanto dinero comprando o arreglando una.

Kinect es un hardware que tiene la opción de reconocimiento que le permitirá al usuario poder tocar dicha batería y ver cómo la toca, así no sólo el usuario toca una batería sino que también podrá verse sumergido así mismo tocarla dándole una gran sensación de participación.

Materiales Utilizados:

-Placa de Desarrollo Arduino uno-R3
-Cable USB (A-B)
-Protoboard
-Leds Infrarrojos
-Wiimote
-Canaleta de luz
-Pulsadores
-Resistor (10 Kohm)
-Banda elástica
-kinect

Instalación:

Antes de proceder ejecutar Air-Drum se necesitan los siguientes software instalado previamente:

1º.-Procesing version 1.5.1
	https://processing.org/download/?processing

2º	Librerias para kinect

	2.1.- Instalar Simpleopennni de arquitectura 32 bit

		https://code.google.com/p/simple-openni/

	2.2.- Descargar,descomprimir y copiar libreria para proccesing de simpleopenni y agregarla a proccesing C:\Users\'your username'\Documents\Processing\libraries

		http://code.google.com/p/simple-openni/downloads/list?can=2&q=SimpleOpenNI&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCountt

		3.3.- Despues probar el ejemplo que se encuentra disponible en la pagina de Simpleopenni para ver que la instalación esta completa.


3º.- Instalar la IDE correspondiente a arduino

Descarga de la pagina: http://www.arduino.cc/

4º.- Instalar los drives correspondiente para arduino

	http://arduino.cc/es/Guide/Windows

5º.- Finalmente instalar la libreria correspondiente que conecta arduino con processing

http://arduino.cc/playground/uploads/Interfacing/processing-arduino.zip


Finalmente despues de haber instaldo todo esto se procede a ejecutar nuestro Air-drum, para complementar el funcionamiento del pedal se utilizo el siguiente circuito:

http://arduino.cc/es/Tutorial/Invert 


Nota Importante: Cabe destacar que todo esto es funciona en el sistema operativo windows de 32 bit, puede llegar a ejecutarse en windows de arquitectura de 64 , pero toda la instalación previa tiene que ser de 32 bit obligatoriamente para su correcto funcionamiento.



Sugerencia: Para trabajar en el entorno de linux se necesita esperar que la libreria de sonido minin sea corregida debido a un bug que existe con java para las versiones de linux basadas en ubuntu.


El codigo completo de Airdrum tambien se encuentra disponible en Google Code
Pagina GoogleCode:https://code.google.com/p/air-drum-kinect-processing-arduino/source/browse/source.pde

