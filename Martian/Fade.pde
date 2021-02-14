int fadeWidth = 0;
int fadeSpeed = 10;
boolean fade(){
  fill(0);
  rect(0,0,fadeWidth,height);
  if(fadeWidth<width+200){
    fadeWidth+=fadeSpeed;
    fadeSpeed+=2;
    fill(255);
    return false;
  }else{
   changeScreens();
   return true; 
  }
  
  //fill(0,fadeWidth);
  //rect(0,0,width,height);
  //if(fadeWidth<255){
  //  fadeWidth+=fadeSpeed;
  //  fadeSpeed+=1;
  //  fill(255);
  //  return false;
  //}else{
  // changeScreens();
  // return true; 
  //}
}

void resetFade(){
  fadeWidth = 0;
  fadeSpeed = 10;
}


boolean unFade(){
  fill(0);
  rect(0,0,width-fadeWidth,height);
  if(fadeWidth<width){
    fadeWidth+=fadeSpeed;
    fadeSpeed+=2;
    return false;
  }else{
   return true;
  }
}
