int syrupCoordinatesX = 525;
int syrupCoordinatesY = 510;

int level2DownCounter = 1;
int syrupLevel = 0;

int level2DialogueCounter = 0; 
boolean level2DialogueFinished = false;

boolean level2Win = false;
boolean level2GoToNext = false;

void level2(){

  for(int i = 0; i<15; i+=1){
    image(bar, -x+i*spaceBg.width,0);
    image(ground,-x+i*ground.width,500);
  }
  
  image(syrupPics[syrupLevel], syrupCoordinatesX, syrupCoordinatesY);
  
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
  
   //Go to next page  
  if(level2Win && level2GoToNext){
    fade();
  }
  
}

void updateSyrupCounter() {
   if (syrupLevel < 4 && level2DownCounter % 5 == 0 && level2DialogueFinished) {
    syrupLevel++;
  }
}

void updateLevel2Win() {
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
