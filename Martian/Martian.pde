import processing.sound.*; 
SoundFile musicFile; 
String musicName = "game.mp3";
String musicPath = "..\\audio\\game.mp3";
Sound s;

void setup() {
  musicPath = sketchPath(musicPath);
  musicFile  = new SoundFile(this, musicPath);
  musicFile.play();
  
  size(900, 700);
  loadImages();
  titleScreenSetup();
  frameRate(60);
  
  s = new Sound(this);
  musicFile.loop();
}

void draw() {
  s.volume(0.1);
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
    case "endingScreen":
        endingDialogScreenDraw();
        break;
    case "creditScreen":
        creditScreenDraw();
        break;
  }
}
