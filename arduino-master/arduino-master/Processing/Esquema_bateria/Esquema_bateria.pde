//Esquema básico de cómo se verá la interfaz con el usuario
int i=1000, j=700;

void setup(){
size(i, j);
noStroke();
rectMode(CORNERS);

}


void draw(){
smooth();



background(227, 184, 128); // Fondo Beige


fill(255, 0,0); // Red color
ellipse(550, 800, 310, 310); // Bombo

for(int i=0;i<=120&& i<=mouseX;i+=10){

fill(i*2, 0, 250-i*2); // Green color
ellipse(350, 600, 200-i, 200-i); // Caja

}
fill(0, 0, 255); // Blue color
ellipse(200, 550, 200, 200); // Hi-Hat
fill(255, 0, 0); // Red color
ellipse(450, 500, 150, 150); // Tomb 14'
fill(255, 0, 0); // Red color
ellipse(650, 500, 160, 160); // Tomb 16'
fill(255, 0, 0); // Red color
ellipse(750, 660, 180, 180); // Tomb 18' o de piso
fill(224, 180, 18); // Color platillo crash
ellipse(400, 300, 150, 150); // Crash 14'
ellipse(600, 300, 160, 160); // Crash 16'
fill(216, 201, 61); // Color platillo China
ellipse(800, 400, 180, 180); // China
fill(255, 247, 0); // Red color
ellipse(980, 600, 220, 220); // Ride


int x=0, y=0;
while(x<i) // grilla
{
  while(y<j)
  {
      point(x,y);
      y=y+50;
  }
x=x+50;
y=0;
} 

// grilla que no sé hacerla como procedimiento... aún.



}
