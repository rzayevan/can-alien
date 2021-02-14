PImage spaceBg;
PFont font;

void setup() {
  size(900, 700);
  spaceBg = loadImage("space.jpg");
  font = createFont("munro.ttf", 40);
}

void startScreenDraw() {
  image(spaceBg, 0,0);
  textFont(font, 40);
  fill(255,0,0);
  text("Illegal Alien", 390, 75);
  fill(255,255,255);
  text("Press  Enter  To  Start", 300, 125);
}
