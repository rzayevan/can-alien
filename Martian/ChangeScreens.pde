String currentScreen = "titleScreen";


void changeScreens(){
  resetFade();
  resetAlien();
  x=0;
  switch(currentScreen) {
    case "titleScreen":
      currentScreen = "startScreen";
      break;
    case "startScreen":
      hockeyScreenSetup();
      currentScreen = "hockeyScreen";
      break;
    case "level2":
      level2();

  }
}
