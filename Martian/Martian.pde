import processing.sound.*; 

void setup() {
  size(900, 700);
  loadImages();
  titleScreenSetup();
  frameRate(60);
}

void draw() {
  switch(currentScreen) {
    case "titleScreen":
        titleScreenDraw();
        break;
    case "spaceshipScreen":
        introSpaceshipScreenDraw();
        break;
    case "level1":
        level1();
        break;
    case "level2":
        level2();
        break;
    case "hockeyScreen":
        hockeyScreenDraw();
        break;
  }
}
