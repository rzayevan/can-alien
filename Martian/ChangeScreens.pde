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
      currentScreen="level1";
      break;
    case "level1":
      currentScreen="level2";
      break;
    case "level2":
      level2Setup();
      currentScreen="hockeyScreen";
      break;
   case "hockeyScreen":
      currentScreen="endingScreen";
      break;
  }
}
