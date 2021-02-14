import processing.sound.*; 

void setup() {
  size(900, 700);
  loadImages();
  
}

void draw() {
  if(x>=0 && speed<0){
      x+=speed;
    }else if(x<1000 && speed>0){
      x+=speed;
    }
    drawAlien(false);
}
