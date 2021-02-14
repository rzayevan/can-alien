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
      level2Setup();
      break;
    case "level2":
      currentScreen="hockeyScreen";
      break;
   case "hockeyScreen":
      currentScreen="endingScreen";
      break;
   case "endingScreen":
      creditScreen();
      currentScreen="creditScreen";
      break;
  }
}
