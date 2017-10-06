
import org.openkinect.freenect.*;
import org.openkinect.processing.*;

//Creem un objecte per accedir a la càmera
//Creamos un objecto para acceder a la camara
Kinect k;


void setup()
{
  //Fem coincidir la mida de pantalla amb la resolució de KINECT
  //Tamaño de ventana es el mismo que la resoución de KINECT 
  size(640, 480);
  //Instanciem KINECT
  //Instanciamos KINECT
  k = new Kinect(this);
  //...i li diem que volem accedir a la info de profunditat
  //...y activamos acceso a la imágen de profundidad
  k.initDepth();
  //Preparem color i gruix del traç
  //Preparamos color y trazo
  stroke(255, 0, 0);
  fill(255,0,0);
  strokeWeight(3);
  textSize(16);
  //Amaguem el cursor
  //Escondemos el cursor
  noCursor();
}
void draw()
{
  //Mostrem la imatge de profunditat
  //Moastramos imágen de profundidad
  image(k.getDepthImage(), 0, 0);

  //Carreguem les dades de profunditat
  //Cargamos los datos de profundidad
  int[] depthValues = k.getRawDepth(); 
  //I en mapejem la posició del ratolí per trobar-ne el lloc dins la matriu
  //Y mapeamos el mouse para encontrar el valor en la matriz
  int mousePosition = mouseX + (mouseY * 640);  
  //I mostrem el valor de profunditat (en mm) d'aquesta pocisió
  //Y mostramos el valor de profundidad (en mm) en esta posición
  text(depthValues[mousePosition], mouseX-10, mouseY+25);//write depth value
  noFill();
  ellipse(mouseX, mouseY, 10, 10);//show reading point
}