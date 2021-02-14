PImage spaceBg;
PFont font;

boolean started = false;

void titleScreenSetup() {
  size(900, 700);
  spaceBg = loadImage("space.jpg");
  spaceBg.resize(900, 700);
  font = createFont("munro.ttf", 40);
}

void titleScreenDraw() {
  image(spaceBg, 0,0);
  textFont(font, 50);
  fill(0,255,0);
  text("Can-alien", 370, 220);
  fill(255,255,255);
  text("Press  Enter  To  Start", 270, 300);
  if(started){
    fade();
  }
}
