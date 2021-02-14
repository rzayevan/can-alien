PImage endScreenBg;
PImage aidanImage;
PImage alyssaImage;
PImage kimImage;
PImage naraImage;
PImage timImage;


void creditScreen() 
{
    aidanImage = loadImage("aidan.png");
    alyssaImage = loadImage("alyssa.png");
    kimImage = loadImage("kim.png");
    naraImage = loadImage("nara.png");
    timImage = loadImage ("tim.png");

  
}

void creditScreenDraw()
{
  for(int i = 0; i<15; i+=1){
    image(mountains, -x+i*mountains.width,0);
    image(ground,-x+i*ground.width,500);
  }
  textFont(font, 40);
  fill(255,255,255);
  text("Thanks for Playing!", 230, 100);
  text("Check the README for credits", 200, 150);
  
  image(aidanImage, 5, 400);
  image(alyssaImage, 170, 400);
  image(kimImage, 380, 400);
  image(naraImage, 540, 400);
  image(timImage, 720, 400);
}
