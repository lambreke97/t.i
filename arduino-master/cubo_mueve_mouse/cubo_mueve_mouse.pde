// Libro: Arduino and Kinect Projects. Enrique Ramos y Ciriaco Castro Díez
// Un cubo 3D con OpenGL, ubicación a partir del mouse.

import processing.opengl.*;
void setup() {
  size (800, 600, OPENGL);
}

void draw(){
background(255);
noFill();

//acá se reemplazan las coordenadas fijas de translate por la ubicación del mouse
translate(mouseX, mouseY);
rotate(45);
box(200);
}