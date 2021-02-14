int syrupCoordinatesX = 525;
int syrupCoordinatesY = 510;

int level2DownCounter = 1;
int syrupLevel = 0;

void level2(){

  for(int i = 0; i<15; i+=1){
    image(spaceBg, -x+i*spaceBg.width,0);
    image(ground,-x+i*ground.width,500);
  }
  if(x>=0 && speed<0){
    x+=speed;
  }else if(x<1000 && speed>0){
    x+=speed;
  }
 
  
  image(syrupPics[syrupLevel], syrupCoordinatesX, syrupCoordinatesY);
  
  level2DrawAlien();
  
  //println(syrupLevel);
  
}

void updateSyrupCounter() {
   if (level2DownCounter % 5 == 0) {
    syrupLevel++;
  }
}

void level2DrawAlien(){

   martianX = 450;
  
  martianY+=jumpSpeed;
  
  if(!onPlatform()){
    jumpSpeed+=1;
  }else{
    if(jumpSpeed<0){
      jumpSpeed+=1;
    }else{
      jumpSpeed=0;
    }
    
  }
  
  switch(state) {
    case "right":
      martianRight.display(martianX, martianY, 0.1);
      break;
    case "left":
      martianLeft.display(martianX, martianY, 0.1);
      break;
    case "idleLeft":
      idleLeft.display(martianX, martianY, 0.1);
      break;
    case "idleRight":
      idleRight.display(martianX, martianY, 0.1);
      break;
    default:

  }
}
