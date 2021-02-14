String currentScreen = "titleScreen";


void changeScreens(){
  resetFade();
  resetAlien();
  x=0;
  switch(currentScreen) {
    case "titleScreen":
      currentScreen = "level1";
      break;
    case "level1":
    // change me
      hockeyScreenSetup();
      currentScreen = "hockeyScreen";
      break;

  }
}
