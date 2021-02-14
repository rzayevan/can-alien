PImage calgary;
PImage office;
PImage platformGround;
PImage HQ;
PImage cityHall;
PImage pipe;
PImage smallPipe;
PImage emptyPipe;
PImage bus;
PImage ground;

PImage[] clothesPics;

float x = 0;
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
  
  clothesPics = new PImage[] {loadImage("Hat.png"),loadImage("Coat.png"),loadImage("Scarf.png")};
  
  ground = loadImage("Ground.png");
  platformGround = loadImage("Ground.png");
  platformGround.resize(200,30);
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
   martianX = 450;
  }
  martianY+=jumpSpeed;
  if(!onPlatform()){
    jumpSpeed+=1;
  }else{
    if(jumpSpeed<0){
      jumpSpeed+=1;
    }else{
      jumpSpeed=0;
    }
    
  }
  
  switch(state) {
    case "right":
      martianRight.display(martianX, martianY, 0.1);
      if(speed<3){
        speed += 1;
      }
      break;
    case "left":
      martianLeft.display(martianX, martianY, 0.1);
      if(speed>-3){
        speed -= 1;
      }
      break;
    case "idleLeft":
      idleLeft.display(martianX, martianY, 0.1);
      speed=0;
      break;
    case "idleRight":
      idleRight.display(martianX, martianY, 0.1);
      speed=0;
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
      state = "right";
      break;
    case LEFT:
      state="left";
      break;
    case UP:
      if(martianY>=450 || onPlatform()){
        jumpSpeed = -20;
      }
      break;
    case ENTER:
      started = true;
      break;
  }
}


void keyReleased() {
  if(keyCode!=38){
    if(state=="right"){
          state="idleRight";
    }else if(state=="left"){
          state="idleLeft";
    }
  }
}
