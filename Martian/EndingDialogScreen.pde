int endingDialogCounter = 0;
int endingDialogMax = 5;
boolean drawAlienEnd = true;
int beamUpPosY = 450;
boolean beamUpFinished = false;
int spaceshipX = 250;
boolean finished = false;

void endingDialogScreenDraw() 
{
  image(spaceBg, 0,0);
  image(dialogBox, dialogPosX, dialogPosY);
  textFont(font, 30);
  if(drawAlienEnd)
  {
    drawAlien(true);
  }
  switch(endingDialogCounter)
  {
     case 0:
       fill(0,0,0);
       text("Mysteries to be solved another time, I suppose. Looks like I’ve", dialogTextPosX, dialogTextPosY);
       text("done everything on my list.", dialogTextPosX, dialogTextPosY + 35);
       break;
     case 1:
       text("Just in time too, the Sol’s gone down already.  Time to head home. ", dialogTextPosX, dialogTextPosY);
       break;
     case 2:
       text("Next time I’ll have to visit Mr. Horton and have one of his “double", dialogTextPosX, dialogTextPosY);
       text("doubles.”", dialogTextPosX, dialogTextPosY + 35);
       break;
     case 3 :
       text("Maybe Stanley will lend me his cup.  Perhaps the Queen would like to", dialogTextPosX, dialogTextPosY);
       text("join me.", dialogTextPosX, dialogTextPosY + 35);
       break;
     case 4 : 
       text("So long for now Canada!  May you stay glorious and free.", dialogTextPosX, dialogTextPosY);
       drawAlienEnd = false;
       if(!beamUpFinished)
       {
         drawBeamUpAlien();
       }
       else
       {
         drawSpaceshipLeft();
       }
       break;
  }
  
   if(finished)
   {
       fade(); 
   }
}
  
void drawBeamUpAlien()
{
  image(beam, 350, beamPosY + 100);
  martianRight.display(martianX, beamUpPosY, 0.1);
  image(spaceship, spaceshipX, yPosSpaceship + 200);

   if(beamUpPosY >290)
   {
     beamUpPosY -= 1;
   }
   else
   {
     beamUpFinished = true; 
   }
}

void drawSpaceshipLeft()
{
  image(spaceship, spaceshipX, yPosSpaceship + 200);
  if(spaceshipX <= 950)
  {
   spaceshipX += 5; 
  }
  else
  {
    finished = true;
  }
  
}

 
