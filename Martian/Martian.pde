import processing.sound.*; 

void setup() {
  size(900, 700);
  loadImages();
  titleScreenSetup();
}

void draw() {
  switch(currentScreen) {
    case "titleScreen":
        titleScreenDraw();
        break;
    case "startScreen":
        level1();
        break;
  }
}
