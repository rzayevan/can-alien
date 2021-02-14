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

int x = 0;
float martianX = 400;
float martianY = 350;
Animation martianRight, martianLeft, idleRight,idleLeft;

String state = "idleRight";
int speed = 0;
int jumpSpeed = 0;

void loadImages() {
  
  martianRight = new Animation("Right", 2);
  martianLeft = new Animation("Left", 2);
  idleRight = new Animation("Idle",2);
  idleLeft = new Animation("LeftIdle",2);
  
  //calm = new SoundFile(this, "Retroland_Recital.wav"); 
  //bezos = new SoundFile(this, "Conferring_with_an_Old_Master.wav"); 
  //zen = new SoundFile(this, "Digital_Zen.wav"); 
  //pipeBoi = new SoundFile(this, "All_Time_High_Jump.wav"); 

  //calm.loop();
}


void drawAlien(boolean moves){
  if(moves){
    if((martianX>0 && speed<0) || (martianX<width-110 && speed>0)){
      martianX+=speed*2;
    }

  
  }else{
   martianX = 350;
  }
  martianY+=jumpSpeed;
  
  if(martianY<=350){
    jumpSpeed+=1;
  }else{
    jumpSpeed=0;
  }
  
  switch(state) {
    case "right":
      martianRight.display(martianX, martianY, 0.1);
      break;
    case "left":
      martianLeft.display(martianX, martianY, 0.1);
      break;
    case "idleLeft":
      idleLeft.display(martianX, martianY, 0.1);
      break;
    case "idleRight":
      idleRight.display(martianX, martianY, 0.1);
      break;
    default:

  }
}

void resetAlien(){
  martianX = 400;
}

void keyPressed() {
  switch(keyCode) {    
    case RIGHT:
      speed = 1;
      state = "right";
      break;
    case LEFT:
      speed = -1;
      state="left";
      break;
    case UP:
      if(martianY>=350){
        jumpSpeed = -15;
      }
      break;
    case ENTER:
      started = true;
      break;
  }
}


void keyReleased() {
  if(keyCode!=38){
    speed=0;
    if(state=="right"){
          state="idleRight";
    }else if(state=="left"){
          state="idleLeft";
    }
  }
}
