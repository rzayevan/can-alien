void level1(){
  image(spaceBg, -x,0);
  if(x>=0 && speed<0){
    x+=speed;
  }else if(x<1000 && speed>0){
    x+=speed;
  }
  
  
  drawAlien(false);
}
