String currentScreen = "titleScreen";


void changeScreens(){
  resetFade();
  resetAlien();
  x=0;
  switch(currentScreen) {
    case "titleScreen":
<<<<<<< HEAD
      currentScreen = "level1";
      break;
    case "level1":
    // change me
=======
      introSpaceshipScreenSetup();
      currentScreen = "spaceshipScreen";
      break;
    case "spaceshipScreen":
>>>>>>> 26477eb682eadc37309f151bbda2889eb6ceb662
      hockeyScreenSetup();
      currentScreen="level2";
      break;
    case "level2":
      level2();
      currentScreen="hockeyScreen";
      break;
  }
}
