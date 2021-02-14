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
  textFont(font, 40);
  fill(0,255,0);
  text("Illegal Alien", 350, 220);
  fill(255,255,255);
  text("Press  Enter  To  Start", 270, 300);
  if(started){
    fade();
  }
}
