void level1(){
  background(255);
  if(x>=0 && speed<0){
    x+=speed;
  }else if(x<1000 && speed>0){
    x+=speed;
  }
  drawAlien(false);
}
