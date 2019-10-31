Particle[] star;//your code here
boolean backColor = true;
int colorChange = 0;
void setup()
{
  size(300, 300);
  star = new Particle[400];
  for(int i = 0; i < star.length; i++){
    star[i] = new Particle();
  }
  star[0] = new OddballParticle();
}

void draw()
{
  if(backColor == true){
    background(0);
  }else{
    background(255);
  }
  for(int i = 0; i < star.length; i++){
    star[i].show();

    star[i].explode();
  }
 
}

void mousePressed(){

  
   if(get(mouseX, mouseY) == star[0].myColor){
  
     //blue
     if(colorChange % 2 == 0){
       backColor = !backColor;
        for(int i = 0; i < star.length; i++){
           star[i].mySpeed *= (-1);
           star[i].myColor =color((int)(Math.random()*0), (int)(Math.random()*155), (int)(Math.random()*255) );
        }
       colorChange++;
       
     } else{
       //red
        for(int i = 0; i < star.length; i++){
           star[i].mySpeed *= (-2);
           star[i].myColor =color((int)(Math.random()*255), (int)(Math.random()*155), (int)(Math.random()*0) );
        }
       colorChange ++;
    
       }
    
     }
   }



class Particle
{
  double myX, myY, mySize, myAngle, mySpeed;
  int myColor;
  
  Particle(){
    myX = 150;
    myY = 150;
    myColor = color(255, 192, 203);
    mySize = 3; //(int)(Math.random()*10);
    mySpeed = (Math.random()*2 + 0.1)  /*add decimal? (Math.random()*100)*/;
    myAngle= (Math.random()*(2*Math.PI));
  }
  void show(){
    fill(myColor);
    ellipse((float)(myX), (float)(myY), (float)(mySize), (float)(mySize));
  }
  void explode(){
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
    mySize += 0.01;
  }
}

  
class OddballParticle extends Particle//inherits from Particle
{
  OddballParticle(){
    myX = 150;
    myY = 150;
    myColor = color(255);
    mySize = 25; //(int)(Math.random()*10);
    mySpeed = 0.06; /*add decimal? (Math.random()*100)*/;
    myAngle= (Math.random()*(1*Math.PI));
  }
  void show(){
    fill(myColor);
    ellipse((float)(myX), (float)(myY), (float)(mySize), (float)(mySize));
  }
  void explode(){
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
    
  }
  
}