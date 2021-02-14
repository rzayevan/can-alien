String currentScreen = "titleScreen";


void changeScreens(){
  resetFade();
  resetCow();
  x=0;
  switch(currentScreen) {
    case "titleScreen":
      currentScreen = "startScreen";
      break;

  }

}
