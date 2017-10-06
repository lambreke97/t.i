import lll.wrj4P5.*; //importa libreria  
import lll.Loc.*;
Wrj4P5 wii; //crea un nuovo oggetto  
float xmag, ymag = 0;   
float newXmag, newYmag = 0;  
float x=1;   
void setup() {   
 size(640, 360, P3D);  
 noStroke();   
 colorMode(RGB, 1);   
 wii=new Wrj4P5(this);   
 wii.connect(); //cerca il wiimote   
}   
   
void draw() {   
 background(0.5);   
 pushMatrix();   
 translate(width/2, height/2, -30);
  Loc p=wii.rimokon.irLights[0];
  Loc a=wii.rimokon.irLights[1];
  Loc b=wii.rimokon.irLights[2];
  Loc c=wii.rimokon.irLights[3]; 
 newXmag = (wii.rimokon.senced.x*150)/float(width) * TWO_PI;   
 newYmag = (wii.rimokon.senced.y*150)/float(height) * TWO_PI;   
 float diff = xmag-newXmag;  
 if (abs(diff) >  0.01) { xmag -= diff/4.0; }   
   
 diff = ymag-newYmag;  
 if (abs(diff) >  0.01) { ymag -= diff/4.0; }   
   
 rotateX(-ymag);   
 rotateY(-xmag);   
 scale(90);   
 beginShape(QUADS);  
   
 fill(0, 1, 1); vertex(-1,  1,  1);   
 fill(1, 1, 1); vertex( 1,  1,  1);   
 fill(1, 0, 1); vertex( 1, -1,  1);   
 fill(0, 0, 1); vertex(-1, -1,  1);  
   
 fill(1, 1, 1); vertex( 1,  1,  1);  
 fill(1, 1, 0); vertex( 1,  1, -1);  
 fill(1, 0, 0); vertex( 1, -1, -1);  
 fill(1, 0, 1); vertex( 1, -1,  1);   
   
 fill(1, 1, 0); vertex( 1,  1, -1);  
 fill(0, 1, 0); vertex(-1,  1, -1);  
 fill(0, 0, 0); vertex(-1, -1, -1);  
 fill(1, 0, 0); vertex( 1, -1, -1);  
   
 fill(0, 1, 0); vertex(-1,  1, -1);  
 fill(0, 1, 1); vertex(-1,  1,  1);  
 fill(0, 0, 1); vertex(-1, -1,  1);  
 fill(0, 0, 0); vertex(-1, -1, -1);  
   
 fill(0, 1, 0); vertex(-1,  1, -1);  
 fill(1, 1, 0); vertex( 1,  1, -1);  
 fill(1, 1, 1); vertex( 1,  1,  1);   
 fill(0, 1, 1); vertex(-1,  1,  1);   
   
 fill(0, 0, 0); vertex(-1, -1, -1);  
 fill(1, 0, 0); vertex( 1, -1, -1);  
 fill(1, 0, 1); vertex( 1, -1,  1);   
 fill(0, 0, 1); vertex(-1, -1,  1);   
   
 endShape();  
 popMatrix(); 
} 
