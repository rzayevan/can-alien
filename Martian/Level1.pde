int[][] platforms = new int[][] {{500,400,200},{750,150,200},{800,400,200},{1050,230,200},{1300,270,200}};
int[][] clothes = new int[][] {{500,250,0,0},{800,400,1,0},{800,270,2,0},{1050,100,0,0},{1300,140,2,0},{1300,400,2,0},{750,20,1,0}};

int collected = 0;

void level1(){
  for(int i = 0; i<15; i+=1){
    image(mountains, -x+i*mountains.width,0);
    image(ground,-x+i*ground.width,500);
  }
  if(x>=0 && speed<0){
    x+=speed;
  }else if(x<1000 && speed>0){
    x+=speed;
  }
  
  textFont(font, 40);
  fill(0,255,0);
  text("Clothing: x"+str(collected), 700, 50);
  text("Collect all the clothing!!!", 200, 50);
  
  //Drawing Clothes and Collecting Clothes
  for(int i = 0; i<clothes.length; i+=1){
    //Drawing
    if(clothes[i][3] == 0){
      image(clothesPics[clothes[i][2]], clothes[i][0]-x,clothes[i][1]);
    }
    //Collecting
    if(clothes[i][3]==0 && martianX > clothes[i][0]-x && martianX < clothes[i][0]-x + clothesPics[clothes[i][2]].width && martianY > clothes[i][1] && martianY < clothes[i][1] + clothesPics[clothes[i][2]].height/2){
      clothes[i][3] = 1;
      collected++;
    }
  }
  
  //Drawing platforms
  for(int i = 0; i<platforms.length; i+=1){
    noFill();
    stroke(255);
    strokeWeight(2);
    image(platformGround,platforms[i][0]-x,platforms[i][1]-5);
    rect(platforms[i][0]-x,platforms[i][1]+5,platforms[i][2],19);
  }
  

  
  drawAlien(false);
  
    if(collected>=clothes.length){
    fade();
  }
}


boolean onPlatform(){
  boolean onPlatform = false;
  for(int i = 0; i<platforms.length; i+=1){
    if(martianX>platforms[i][0]-x-45 && martianX<platforms[i][0]-x+platforms[i][2]-30 && martianY < platforms[i][1]-100 && martianY > platforms[i][1]-130 && currentScreen == "level1"){
      onPlatform = true;
    }
  }
  
  if(martianY>=450){
  onPlatform=true;
  }
  
  return onPlatform;
}
