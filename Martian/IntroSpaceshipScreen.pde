int yPosSpaceship = 0;
boolean nextPage = false;
int spaceshipDialogCounter = 0;

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
     image(beam, 80, 380);
     drawAlien(false);
  }
  image(spaceship, 0, yPosSpaceship);

  
  if(spaceshipDialogCounter == 1){
    fade();
  }
 
}
