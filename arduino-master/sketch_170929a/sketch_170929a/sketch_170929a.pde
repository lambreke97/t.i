import org.openkinect.freenect.*;
import org.openkinect.tests.*;
import org.openkinect.processing.*;
import org.openkinect.freenect2.*;

 Kinect k;
 PImage fondo,depthImg,mario,callampa,fantasma, kk,dragon;
 float deg;
 boolean colorDepth = false;
 boolean mirror = false;
 boolean ir=false;
 void setup(){
   k=new Kinect(this);
   fondo=loadImage("descarga.jpg");
   mario=loadImage("mario.jpg");
   callampa=loadImage("callampa.jpg");
   fantasma=loadImage("fantasma.jpg");
   kk=loadImage("kk.png");
   dragon=loadImage("dragon.jpg");
   k.initVideo();
   k.initDepth();
   k.enableColorDepth(colorDepth);
   size(1500,900);
 }


void draw(){
  
  background(fondo);
  image(k.getVideoImage(), 0,0);
  image(mario, 1200, 0,100,70);
  /*image(callampa, 640, 0);
  image(fantasma, 640, 0);
  image(kk, 640, 0);
  image(dragon, 640, 0);
  */
  
  fill(255);
  text(
    " Pulse 'i' para activar / desactivar entre la imagen de vídeo y la imagen IR,\n   "  +
    " Pulse 'c' para habilitar / deshabilitar entre profundidad de color y profundidad de escala de grises,\n   "  +
    " Presione 'm' para habilitar / modo cambiar mirada,\n " +
    " ARRIBA y ABAJO para inclinar la cámara    "  +
    "Framerate: " + int(frameRate), 10, 515);
}

void keyPressed() {
  if (key == 'i') {
    ir = !ir;
    k.enableIR(ir);
  } else if (key == 'c') {
    colorDepth = !colorDepth;
    k.enableColorDepth(colorDepth);
  }else if(key == 'm'){
    mirror = !mirror;
    k.enableMirror(mirror);
  } else if (key == CODED) {
    if (keyCode == UP) {
      deg++;
    } else if (keyCode == DOWN) {
      deg--;
    }
    deg = constrain(deg, 0, 30);
    k.setTilt(deg);
  }
}

