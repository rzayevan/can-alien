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
PImage spaceship;
PImage beam;
PImage dialogBox;
PImage todoList;

PImage[] clothesPics;
PImage[] syrupPics;

float x = 0;
float martianX = 400;
float martianY = 350;
Animation martianRight, martianLeft, idleRight,idleLeft;

String state = "idleRight";
int speed = 0;
int jumpSpeed = 0;

boolean btnPressed = false;

void loadImages() {
  
  martianRight = new Animation("Right", 2);
  martianLeft = new Animation("Left", 2);
  idleRight = new Animation("Idle",2);
  idleLeft = new Animation("LeftIdle",2);
  
  clothesPics = new PImage[] {loadImage("Hat.png"),loadImage("Coat.png"),loadImage("Scarf.png")};
  
  syrupPics = new PImage[] {
    loadImage("Straw1.png"),
    loadImage("Straw2.png"),
    loadImage("Straw3.png"),
    loadImage("Straw4.png"),
    loadImage("Straw5.png"),
  };
  
  for (int i = 0; i < 5; i++) {
    syrupPics[i].resize(100, 80);
  }

  
  ground = loadImage("Ground.png");
  platformGround = loadImage("Ground.png");
  platformGround.resize(200,30);
  //calm = new SoundFile(this, "Retroland_Recital.wav"); 
  //bezos = new SoundFile(this, "Conferring_with_an_Old_Master.wav"); 
  //zen = new SoundFile(this, "Digital_Zen.wav"); 
  //pipeBoi = new SoundFile(this, "All_Time_High_Jump.wav"); 
  spaceship = loadImage("Spaceship.png");
  beam = loadImage("Beam.png");
  beam.resize(200, 200);
  dialogBox = loadImage("DialogBox.png");
  dialogBox.resize(900, 100);
  todoList = loadImage("TodoList.png");
  todoList.resize(500,600);
  
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
  btnPressed = true;
  switch(keyCode) {    
    case RIGHT:
      state = "right";
      break;
    case LEFT:
      state="left";
      break;
    case UP:
      
      if (currentScreen != "level2") {
        if(martianY>=450 || onPlatform()){
          jumpSpeed = -20;
        }
      }else if(currentScreen == "hockeyScreen"){
        state = "up";
      }
      break;
    case DOWN:
      if (currentScreen == "level2" && state == "idleRight") {
        level2DownCounter++;
        updateSyrupCounter();
      }
      else if (currentScreen == "hockeyScreen") {
        state = "down";
    }
    case ENTER:
      started = true;
      if(currentScreen == "spaceshipScreen" && startDialog)
      {
       spaceshipDialogCounter++; 
      }
      else if (currentScreen == "level2" && !level2DialogueFinished) {
        level2DialogueCounter++;
      }
      else if (currentScreen == "level2" && !level2GoToNext) {
        updateLevel2Win();
      }
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
