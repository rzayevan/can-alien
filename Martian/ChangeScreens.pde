String currentScreen = "startScreen";


void changeScreens(){
  resetFade();
  resetAlien();
  x=0;
  switch(currentScreen) {
    case "startScreen":
      currentScreen = "walkToOffice";
      break;

  }
}
