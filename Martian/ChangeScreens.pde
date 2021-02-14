String currentScreen = "titleScreen";


void changeScreens(){
  resetFade();
  resetAlien();
  x=0;
  switch(currentScreen) {
    case "titleScreen":
      introSpaceshipScreenSetup();
      currentScreen = "spaceshipScreen";
      break;
    case "spaceshipScreen":
      hockeyScreenSetup();
      currentScreen="level2";
      break;
    case "level2":
      level2();
      currentScreen="hockeyScreen";
      break;
  }
}
