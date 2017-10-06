// Libro: Arduino and Kinect Projects. Enrique Ramos y Ciriaco Castro Díez
// Código para acceder al mapa de profundidad (Depth Map)

SimpleOpenNI.*;
SimpleOpenNI kinect;

void setup(){
 kinect = new SimpleOpenNI(this); 
 //enable depthMap and RGB image (habilita Mapa de profundidad e imagen RGB):
kinect.enableDepth();
//kinect.enableRGB();
kinect.enableRGB(); // se puede cambiar 'RGB' por 'ir' de acá en adelante para cambiar la imagen RGB por la Infrarroja
//enable mirror (habilita espejo):
kinect.setMirror(true);

size(kinect.depthWidth()+kinect.RGBWidth(), kinect.depthHeight());
}

void draw(){
kinect.update();
//draw depthImageMap and RGB images (dibuja imagen de mapa de profundidad e imagen RGB):
image(kinect.depthImage(), 0, 0);
image(kinect.RGBImage(), kinect.depthWidth(), 0);
}