class Boton{                                                  // clase boton
int    tag;                                                  // valor asignado a botón
int    x, y;                                                 // atributos de posición
int    w, h;                                                 // atributos de tamaño
PImage img;                                                  // atributo  de imagen

//
public Boton(int t,int x, int y, int w, int h, PImage img) { // método constructor
this.tag = t;                                              // que crea una instancia
this.x   = x;                                              // de la clase y asigna a
this.y   = y;                                              // sus atributos valores
this.w   = w;                                              // pasados como parámetro
this.h   = h;                                              //
this.img = img;                                            //
}                                                            //
//
void draw() {                                                // boton dibuja su imagen
image(img, x, y, w, h);                                    //
}                                                            //
//
public PImage getImagen() { return img; }                    // getter para obtener imagen
public int    getTag()    { return tag; }                    // getter para obtneer el tag
//
public void   setImagen(PImage img) { this.img = img; }      // setter para cambiar imagen
public void   setTag(int t) { this.tag = t; }                // setter para cambiar tag
//
public boolean Clic() {                                      // método que devuelve verdadero
if(mousePressed                                            // si el botón del ratón está pulsado
&& mouseX > x                                           // más allá de inicio horizontal del botón
&& mouseX < x + w                                       // antes del final horizontal del botón
&& mouseY > y                                           // más allá de inicio vertical del botón
&& mouseY < y + h) return true;                         // antes de final vertical del botón
return false;                                              // pero falso en caso contrario
}                                                            //
}

import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

CountdownTimer timer;
String timerCallbackInfo = "";

Boton[] arreglo = new Boton[8];
Boton[] jugarA = new Boton[1];
PImage[] images = new PImage[4];
int[] eliminados = new int[8];
int aciertos = 0;

int anterior = -1;
int siguiente = -1;
int primero = -1;
int ultimo = -1;
int clicks = 0;

boolean jugando = false;

void setup() {
size(800,250);

int pos = 0;

while(pos<4){
PImage image = loadImage(pos+"1.jpg");
images[pos] = image;
pos = pos+1;
}
SetFirstButtons();
}

void draw(){
for(int pos=0; pos<8; pos++){
Boton b = arreglo[pos];
b.draw();
}
}

void SetFirstButtons(){
int x = 0;
int tag=0;
int posX=-1;
int posY=-1;
int w=80;
int h=80;
PImage imagen;

while(x<8){

if(tag==4){
tag=0;
}

eliminados[x] = 0;

posX = (80*x)+80;
posY = 40;

imagen = loadImage("fondo.jpg");

Boton boton = new Boton(tag,posX,posY,w,h,imagen);

arreglo[x] = boton;
boton.draw();
x = x+1;

tag = tag+1;
}
tag=-1;
posX=80*4;
posY=140;
w=150;
h=60;
imagen = loadImage("descarga.jpg");
Boton botonJugar = new Boton(tag,posX,posY,w,h,imagen);
jugarA[0] = botonJugar;
botonJugar.draw();
}

void desordenar(){
int cero = 0;
int uno = 0;
int dos = 0;
int tres = 0;

int rand = -2;
boolean entre = false;

for(int x = 0; x < 8; x++){
entre = false;
while(entre==false){
rand = int(random(4));
if(rand == 0 && cero <2){
cero++;
Boton b = arreglo[x];
b.setTag(rand);
entre = true;
}
if(rand == 1 && uno < 2){
uno++;
Boton b = arreglo[x];
b.setTag(rand);
entre = true;
}
if(rand == 2 && dos < 2){
dos++;
Boton b = arreglo[x];
b.setTag(rand);
entre = true;
}
if(rand == 3 && tres < 2){
tres++;
Boton b = arreglo[x];
b.setTag(rand);
entre = true;
}
}
Boton a = arreglo[x];
PImage nueva = loadImage("fondo.jpg");
a.setImagen(nueva);
a.draw();
}
}

void onTickEvent(CountdownTimer t, long timeLeftUntilFinish) {
timerCallbackInfo = "[tick] – timeLeft: " + timeLeftUntilFinish + "ms";
}

void onFinishEvent(CountdownTimer t) {
Boton inicio = arreglo[primero];
Boton fin = arreglo[ultimo];

if(inicio.tag == fin.tag){
eliminados[primero] = -1;
eliminados[ultimo] = -1;
aciertos++;
}
else{
PImage nueva = loadImage("fondo.jpg");
inicio.setImagen(nueva);
fin.setImagen(nueva);
inicio.draw();
fin.draw();
}

if(aciertos == 4){
aciertos = 0;
SetFirstButtons();
}

jugando = false;
timer.stop(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
timerCallbackInfo ="[finished]";
}

void mousePressed(){
if(jugando == false){
boolean salir = false;
boolean click = false;
int tagBoton=-2;
PImage nueva;
int pos = 0;

Boton j = jugarA[0];
if(j.Clic() == true){
desordenar();
}
else{
while(salir == false){
Boton boton = arreglo[pos];
click = boton.Clic();
if(click == true){
if(eliminados[pos] == 0){
clicks++;

tagBoton = boton.tag;
nueva = images[tagBoton];
boton.setImagen(nueva);
boton.draw();
if(clicks == 1){
primero = pos;
}
if(clicks == 2){
clicks = 0;
ultimo = pos;
jugando = true;
timer = CountdownTimerService.getNewCountdownTimer(this).configure(500,1500).start();
}
}
salir = true;
}
else{
boton.draw();
}
pos = pos+1;
}
}
}
}