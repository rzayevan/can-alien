PImage calgary;
PImage office;
PImage ground;
PImage platformGround;
PImage HQ;
PImage cityHall;
PImage pipe;
PImage smallPipe;
PImage emptyPipe;
PImage bus;

SoundFile calm;
SoundFile bezos;
SoundFile zen;
SoundFile pipeBoi;

int x = 0;
float martianX = 400;
float martianY = 400;
Animation martianRight, martianLeft, idleRight,idleLeft;

String cowState = "idleRight";
int speed = 0;
int jumpSpeed = 0;

void loadImages() {
  
  martianRight = new Animation("Right", 2);
  martianLeft = new Animation("Left", 2);
  idleRight = new Animation("Idle",2);
  idleLeft = new Animation("LeftIdle",2);
  
  calm = new SoundFile(this, "Retroland_Recital.wav"); 
  bezos = new SoundFile(this, "Conferring_with_an_Old_Master.wav"); 
  zen = new SoundFile(this, "Digital_Zen.wav"); 
  pipeBoi = new SoundFile(this, "All_Time_High_Jump.wav"); 

  calm.loop();
}


void drawAlien(boolean moves){
  if(moves){
    if((martianX>0 && speed<0) || (martianX<width-110 && speed>0)){
      martianX+=speed*2;
    }
    martianY-=jumpSpeed;
  
  }else{
   martianX = 400;
   martianY = 470;
  }
  
  switch(cowState) {
    case "right":
      martianRight.display(martianX, martianY, 0.3);
      break;
    case "left":
      martianLeft.display(martianX, martianY, 0.3);
      break;
    case "idleLeft":
      idleRight.display(martianX, martianY, 0.15);
      break;
    case "idleRight":
      idleLeft.display(martianX, martianY, 0.15);
      break;
    default:

  }
}

void resetCow(){
  martianX = 400;
}

void keyPressed() {
  switch(keyCode) {    case RIGHT:
      speed = 1;
      cowState = "right";
      break;
    case LEFT:
      speed = -1;
      cowState="left";
      break;
  }
}


void keyReleased() {
  if(keyCode!=38){
    speed=0;
    if(cowState=="right"){
          cowState="idleRight";
    }else if(cowState=="left"){
          cowState="idleLeft";
    }
  }
}
