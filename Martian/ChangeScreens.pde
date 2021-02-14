String currentScreen = "startScreen";


void changeScreens(){
  resetFade();
  resetCow();
  x=0;
  switch(currentScreen) {
    case "startScreen":
      currentScreen = "walkToOffice";
      break;

  }

}
