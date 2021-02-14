int syrupCoordinatesX = 525;
float syrupCoordinatesY = 525;

int level2DownCounter = 1;
int syrupLevel = 0;

int level2DialogueCounter1 = 0;
boolean level2DialogueFinished1 = false;

int level2DialogueCounter2 = 0;
boolean level2DialogueFinished2 = false;

boolean level2Win = false;
boolean level2GoToNext = false;

int instructionArrowCoordinatesX = 470;
float instructionArrowCoordinatesY = 400;

int level2FrameCounter = 0;
int level2ArrowIndex = 0;

boolean level2GameStart = false;

void level2Setup() {
  wearClothes();
  syrupCoordinatesY = martianY + 60;
  instructionArrowCoordinatesY = martianY - 80;
  dialogBox.resize(900, 100);
}

void level2(){

  for(int i = 0; i<15; i+=1){
    image(bar, -x+i*spaceBg.width, 0);
  }

  image(syrupPics[syrupLevel], syrupCoordinatesX, syrupCoordinatesY);


  level2DrawAlien();



  if(!level2DialogueFinished1)
  {
   level2Dialogue1();
  }
  else if (level2Win) {

    level2Dialogue2();

    //Go to next page
    if(level2Win && level2DialogueFinished2 && level2GoToNext){
      fade();
    }
  }
  else {
    fill(0,255,0);
    text("Press down to drink!", 350,250);
    drawArrow();

    if (!level2Win) {
      drawArrow();
    }

   if (syrupLevel >= 4) {
      level2Win = true;
    }

  }

  level2FrameCounter++;
}

void drawArrow() {
   if (level2FrameCounter > 20) {
     level2FrameCounter = 0;
     level2ArrowIndex = (level2ArrowIndex == 0) ? 1 : 0;
   }

   image(downArrowPics[level2ArrowIndex], instructionArrowCoordinatesX, instructionArrowCoordinatesY);
}

void updateSyrupCounter() {
   if (syrupLevel < 4 && level2DownCounter % 5 == 0 && level2DialogueFinished1) {
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

void level2Dialogue1()
{
  textFont(font, 30);
  image(dialogBox, dialogPosX, dialogPosY);
  switch(level2DialogueCounter1)
  {
     case 0:
       fill(0,0,0);
       text("That's better, now I fit right in!", dialogTextPosX, dialogTextPosY);
       break;
     case 1:
       fill(0,0,0);
       text("I found some sort of goose jacket.  This is the pinnacle", dialogTextPosX, dialogTextPosY);
       text(" of Canadian fashion, I’m sure.", dialogTextPosX, dialogTextPosY + 35);
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
       level2DialogueFinished1 = true;
       break;
  }
}

void level2Dialogue2()
{
  image(dialogBox, dialogPosX, dialogPosY);
  textFont(font, 30);
  switch(level2DialogueCounter2)
  {
     case 0:
       fill(0,0,0);
       text("Well, honestly I don’t quite see the appeal. ", dialogTextPosX, dialogTextPosY);
       text("That was kind of painful.", dialogTextPosX, dialogTextPosY + 35);
       break;
     case 1:
       fill(0,0,0);
       text("All that tobogganing must really toughen Canadians up if  ", dialogTextPosX, dialogTextPosY);
       text("they’re able to eat this stuff every day. ", dialogTextPosX, dialogTextPosY + 35);
       break;
     case 2:
       fill(0,0,0);
       text("Or maybe it’s just because they ride polar bears to work. ", dialogTextPosX, dialogTextPosY);
       break;
    case 3:
       fill(0,0,0);
       text("Speaking of work, how does that Terran saying go? ", dialogTextPosX, dialogTextPosY);
       text("Work hard, play hard!", dialogTextPosX, dialogTextPosY + 35);
       break;
     case 4:
       fill(0,0,0);
       text("And what could be more fun than hockey?", dialogTextPosX, dialogTextPosY);
       text("Canada's createst pastime!", dialogTextPosX, dialogTextPosY + 35);
       level2DialogueFinished2 = true;
       break;
  }
}
