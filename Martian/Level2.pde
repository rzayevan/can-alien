int syrupCoordinatesX = 525;
int syrupCoordinatesY = 525;

int level2DownCounter = 1;
int syrupLevel = 0;

int level2DialogueCounter = 0; 
boolean level2DialogueFinished = false;

boolean level2Win = false;
boolean level2GoToNext = false;

int instructionArrowCoordinatesX = 470;
int instructionArrowCoordinatesY = 400;

int level2FrameCounter = 0;
int level2ArrowIndex = 0;

boolean gameStart = false;

void level2Setup() {
  wearClothes();
}

void level2(){

  for(int i = 0; i<15; i+=1){
    image(bar, -x+i*spaceBg.width, 0);
  }
  
  image(syrupPics[syrupLevel], syrupCoordinatesX, martianY + 60);
  
  
  level2DrawAlien();
  
  if (syrupLevel >= 4) {
    fill(0,255,0);
    text("YAY!", 450,250);
    level2Win = true;
  }
  
  if(!level2DialogueFinished)
  {
   level2Dialogue(); 
  }
  else {
    if (!gameStart) {
        fill(0,255,0);
        text("DRINK!", 450,250);
    }
    else {
      drawArrow();

      //Go to next page  
      if(level2Win && level2GoToNext){
        fade();
      }
    }
  }
  
  level2FrameCounter++;
}

void drawArrow() {
   if (level2FrameCounter > 40) {
     level2FrameCounter = 0;
     level2ArrowIndex = (level2ArrowIndex == 0) ? 1 : 0;
   }
  
   image(downArrowPics[level2ArrowIndex], instructionArrowCoordinatesX, martianY - 80); 
}

void updateSyrupCounter() {
   if (syrupLevel < 4 && level2DownCounter % 5 == 0 && level2DialogueFinished) {
    syrupLevel++;
  }
}

void updateLevel2Win() {
  println("why");
  if (level2Win) {
    level2GoToNext = true;
  }
}
  

void level2DrawAlien(){

   martianX = 450;
  
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

void level2Dialogue()
{
  image(dialogBox, dialogPosX, dialogPosY);
  switch(level2DialogueCounter)
  {
     case 0:
       fill(0,0,0);
       text("That's better, now I fit right in!", dialogTextPosX, dialogTextPosY);
       break;
     case 1:
       fill(0,0,0);
       text("I found some sort of goose jacket.  This is the", dialogTextPosX, dialogTextPosY);
       text("pinnacle of Canadian fashion, I’m sure.", dialogTextPosX, dialogTextPosY + 35);
       break;
     case 2:
       fill(0,0,0);
       text("But all that running around has made me hungry.", dialogTextPosX, dialogTextPosY);
       text("Time to eat like the locals do.", dialogTextPosX, dialogTextPosY + 35);
       break;
    case 3:
       fill(0,0,0);
       text("I’ve heard that Canadian terrans practically subsist on tree sap alone.", dialogTextPosX, dialogTextPosY);
       text("Wonder what all the fuss is about...", dialogTextPosX, dialogTextPosY + 35);
       level2DialogueFinished = true;
       break;
  }
}
