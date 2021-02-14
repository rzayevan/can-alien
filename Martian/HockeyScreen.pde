PImage hockeyBg;
PImage ddr_blank;
PImage ddr_left;
PImage ddr_right;
PImage ddr_up;
PImage ddr_down;

int target = 380;
int targetL = 50;
int targetD = 105;
int targetU = 170;
int targetR = 230;
int score = 0;
int counterL = int(random(200))-200;
int counterR = int(random(200))-200;
int counterU = int(random(200))-200;
int counterD = int(random(200))-200;
boolean success = false;

int time;
int wait = 2000;

void hockeyScreenSetup() {
  size(900, 700);
  hockeyBg = loadImage("HockeyRinkBackground.png");
  hockeyBg.resize(900, 700);
  ddr_blank = loadImage("DDR_TopPanel.png");
  ddr_left = loadImage("DDR_LeftArrow.png");
  ddr_right = loadImage("DDR_RightArrow.png");
  ddr_up = loadImage("DDR_UpArrow.png");
  ddr_down = loadImage("DDR_DownArrow.png");
  
  font = createFont("munro.ttf", 40);
  btnPressed = false;
}

void hockeyScreenDraw() {
  if (success){
    time = millis();
   // while(millis() - time <= wait){}
    success = false;
  }
  
  image(hockeyBg, 0,0);
  textFont(font, 40);
  image(ddr_blank, 50,310);
  
  fill(255,255,255);
  text("Score: ", 700, 320);
  text(str(score), 820, 320);
  
  if (score >= 500) {
    image(ddr_down, 200, 200); // yay
  } else {
    counterL = dropArrow(ddr_left, targetL, "left", counterL);
    counterR = dropArrow(ddr_right, targetR, "right", counterR);
    counterU = dropArrow(ddr_up, targetU, "up", counterU);
    counterD = dropArrow(ddr_down, targetD, "down", counterD);
  }
}

int dropArrow(PImage arrow, int pos, String direction, int counter)  {
  image(arrow, pos, counter);
  if (counter >= 375 && counter <= 385 && isButtonPressed(direction)) {
    score+=50;
    success = true;
    image(ddr_down, 200, 200); // yay
    counter = int(random(200))-200;
  } else if (counter > 600){
    counter = int(random(200))-200;
  } else {
    counter+=2;
  }
  return counter;
}

boolean isButtonPressed(String direction) {
  if (!btnPressed) {
    return false;
  }
  
  if (state == direction) {
    return true;
  }
  
  return false;
}
