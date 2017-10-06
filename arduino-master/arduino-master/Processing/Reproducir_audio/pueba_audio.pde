
import ddf.minim.* ;
Minim AudioManager; // variable que usaremos como gestor de audio
AudioPlayer MySong; // variable contenedora del auido

void setup(){ //funcion de reproduccion audio (play) 
  size(256, 256);
  AudioManager = new Minim(this); // a la variable AudioManager se le asigna el tipo Minim
  //Minim es un tipo de dato para reporduccion de audio
  //como en java para asignarle el tipo de dato mediante clases o aspecto dinamico se usa new
  MySong = AudioManager.loadFile("02 Nebbie.mp3");// carga el archivo de la carpeta data que se encuentra dentro de la carpeta del proyecto
  MySong.play(); // funcion play
  strokeWeight(5); // longitud de las barras del ecualizador
}
void draw(){ // dibuja el ecualizador
  String s;
  float offset;
  background(0);
  stroke(random(256),random(256),random(256));
  for(int counter = 0; counter < MySong.bufferSize() - 1; counter+=10){
    offset = MySong.left.get(counter)+1;
    line(counter,0, counter, offset*64);
    offset = MySong.right.get(counter)+1;
    line(counter,128, counter, 128+offset*64);
    fill(255,255,0);
    s = "Left channel";
    text(s, 5, 100, 100, 80);
    s = "Right channel";
    text(s, 5, 230, 100, 80);
  }
}

void stop(){ //funcion para al momento de detener o cerrar se detenga la reproduncion 

  MySong.close();
  AudioManager.stop();
  super.stop();
}
