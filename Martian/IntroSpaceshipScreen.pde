int yPosSpaceship = 0;
boolean startDialog = false;
int spaceshipDialogCounter = 0;
int beamPosY = 300;
int spaceshipDialogMax = 6;

int dialogPosX = 0;
int dialogPosY = 600;
int dialogTextPosX = 30;
int dialogTextPosY = 640;

void introSpaceshipScreenSetup() {
  size(900, 700);
  spaceBg = loadImage("space.jpg");
  spaceBg.resize(900, 700);
  font = createFont("munro.ttf", 40);
}

void introSpaceshipScreenDraw() {
  image(spaceBg, 0,0);
  if(yPosSpaceship < 230)
  {
    yPosSpaceship+=2;
  }
  else
  {
    if(beamPosY < 380)
    {
      beamPosY += 10;
    }
     image(beam, 400, beamPosY);
     drawAlien(false);
     startDialog = true;
  }
  image(spaceship, 300, yPosSpaceship);
  
  if(startDialog)
  {
   spaceshipDialog(); 
  }
  
  //Go to next page  
  if(spaceshipDialogCounter >= spaceshipDialogMax){
    fade();
  }
 
}

void spaceshipDialog()
{
  image(dialogBox, dialogPosX, dialogPosY);
  textFont(font, 30);
  switch(spaceshipDialogCounter)
  {
     case 0:
       fill(0,0,0);
       text("Oh Canada. The great white north. At last we meet.", dialogTextPosX, dialogTextPosY);
       break;
     case 1:
       fill(0,0,0);
       text("I've been looking forward to this vacation for the ", dialogTextPosX, dialogTextPosY);
       text("last five sol-cycles!", dialogTextPosX, dialogTextPosY + 35);
       break;
     case 2:
       fill(0,0,0);
       text("Alright, let's not waste a single nanosecond!", dialogTextPosX, dialogTextPosY);
       break;
     case 3:
       drawTodoList();
       break;
     case 4:
       drawTodoList();
       fill(0,0,0);
       text("First I need to get me some human clothes.  I don’t want anyone", dialogTextPosX, dialogTextPosY);
       text("thinking I’m a tourist or anything.", dialogTextPosX, dialogTextPosY + 35);
       break;
     case 5:
       drawTodoList();
       text("Besides, it’s as cold as Neptune out here!", dialogTextPosX, dialogTextPosY);
       break;
  }
}

void drawTodoList()
{
  int todoListXPos = 50;
  int todoListYpos = 50;
  int todoListTextXPos = todoListXPos + 100;
  int todoListTextYPos = todoListYpos + 120;

  
  image(todoList, todoListXPos, todoListYpos);
  fill(255,0,0);
  textFont(font, 50);
  text("TODO:", todoListTextXPos, todoListTextYPos);
  fill(0,0,0);
  textFont(font, 40);
  text("- DRESS", todoListTextXPos + 10, todoListTextYPos + 50);
  text("- EAT", todoListTextXPos + 10, todoListTextYPos + 100);
  text("- CHEER", todoListTextXPos + 10, todoListTextYPos + 150);
  textFont(font, 30);

}
