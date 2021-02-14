void startScreenSetup() {
  
}

void startScreenDraw() {
  background(255);
  if(x>=0 && speed<0){
      x+=speed;
    }else if(x<1000 && speed>0){
      x+=speed;
    }
    drawAlien(true);
}
