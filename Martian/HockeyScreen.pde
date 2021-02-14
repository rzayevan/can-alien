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
int counter = 0;

int time;
int wait = 5000;

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
}

void hockeyScreenDraw() {
  image(hockeyBg, 0,0);
  textFont(font, 40);
  fill(255,255,255);
  text("Score: ", 700, 320);
  text(str(score), 820, 320);
  
  image(ddr_blank, 50,310);
  
  dropArrow(ddr_left, targetL);
}

void dropArrow(PImage arrow, int pos) {
  if (counter >= 380 - 5 && counter <= 380 + 5) {
    time = millis();
    if(millis() - time <= wait){
      text("yay", 200,200);
      time = millis();//also update the stored time
    }
    counter -= 100;
  } else {
    counter+=2;
  }
  image(arrow, pos, counter);
  
}
