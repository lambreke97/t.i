

//Importamos la biblioteca para poder acceder a KINECT
import org.openkinect.freenect.*;
import org.openkinect.processing.*;


//Creamos un objecto para acceder a la camara
Kinect k;


//Color para dibujar luego la silueta
color p = color(255, 0, 0);//set color to paint silhouette

//Máximo y mínimo de distancia dentro de la cual busacaremos al usuario
int minThreshold = 500;
int maxThreshold = 600; 


void setup()
{
  //Fem coincidir la mida de pantalla amb la resolució de KINECT
  //Tamaño de ventana es el mismo que la resoución de KINECT 
  size(640, 480);
  
  //Instanciamos KINECT
  k = new Kinect(this);
  
  //...y activamos acceso a la imágen de profundidad
  k.initDepth();
  //i el vídeo RGB
  //y el vídeo RGB
  k.initVideo();
}
void draw()
{
  //Fons / fondo
  background(0);

  
  //Si clicamos, que se vea la imágen real
  if (mousePressed) {
    image(k.getVideoImage(), 0, 0);//show rgb image
  }
  //Creamos un array para guardar la info de profundidad
  int[] depthValues = k.getRawDepth();
  //...i variables que seran per marcar el rectangle que marca la silueta, que instanciem fora pla
  //..y variables para marcar el rectángulo que marca la silueta, instanciadas fuera pantalla
  int topY = -1;
  int lowY = width+1;
  int leftX = -1; 
  int rightX = height+1; 

  
  //para marcar si hay almenos un píxel ocupado
  boolean onePx = false;
  
  //Doble loop para recorrer todos los píxels
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
  
      //Mapeamos coordenadas a posición en el array
      int currentPosition = x + (y * 640);
  
      //Y leemos el valor
      int currentDepth = depthValues[currentPosition]; 

   
      //Excluyendo 0, que es demasiado cerca o lejos (hola Epi, Hola Blas!)
      if (currentDepth !=0) {
  
        //Miramos si estamos dentro del espacio que nos interesa
        if (currentDepth > minThreshold && currentDepth < maxThreshold) {
  
          //Y si lo estamos, pintamos este píxel en concreto del color p (decidido arriba)
          set(x, y, p);
  
          //Y marcamos que hay un píxel ocupado
          onePx = true;
  
          //Y Miramos si es el píxel más arriba, abajos, izquierda o derecha encontrado hasta ahora
          if (x > leftX)leftX = x;
          else if (x < rightX)rightX = x;
          if (y > topY)topY = y;
          else if (y < lowY)lowY = y;
        }
      }
    }
  }//end of double loop

  
  //Y finalmente, si almenos hay un píxel ocupado, dibujamos la caja contenedora...
  if (onePx) {
    rectMode(CORNERS);
    noFill();
    stroke(0, 255, 0);
    rect(leftX, topY, rightX, lowY);

  
    //...y el centro de la caja (centro de gravedad)
    fill(255, 255, 0);
    noStroke();
    int centerX = leftX + (rightX - leftX)/2;
    int centerY = lowY + (topY - lowY)/2;
    ellipse(centerX, centerY, 20, 20);
  }
}