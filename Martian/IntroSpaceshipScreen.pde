int yPosSpaceship = 0;
boolean startDialog = false;
int spaceshipDialogCounter = 0;
int beamPosY = 300;
int spaceshipDialogMax = 3;

int dialogPosX = 0;
int dialogPosY = 600;
int dialogTextPosX = 30;
int dialogTextPosY = 650;

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
  if(spaceshipDialogCounter == spaceshipDialogMax){
    fade();
  }
 
}

void spaceshipDialog()
{
  image(dialogBox, dialogPosX, dialogPosY);
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
  }
}
