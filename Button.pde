class Button{
//////////////////
//Class Vars

int x;
int y;
int w;
int h;

PImage i;

PImage ho;




////////////////////////////////
// Button Constructor
  Button(int butX, int butY, int butW, int butH, PImage img, PImage hov ){
    x = butX;
    y = butY;
    w = butW;
    h = butH;
    i = img;
    ho = hov;
  }
  

  


boolean isBetween(int num1, int num2, int num3) {
  if (num1 > num2 && num1 < num3) {
    return true;
  } else {
    return false;
  }
}

boolean  isInButton() {
  int buttonX1 = x - w/2;
  int buttonX2 = x + w/2;

  int buttonY1 = y - h/2;
  int buttonY2 = y + h/2;

  if (isBetween(mouseX, buttonX1, buttonX2) == true && isBetween(mouseY, buttonY1, buttonY2) == true) {
    return true;
  } else {
    return false;
  }
}

boolean isPressed(){
  if (mousePressed && isInButton()){
    return true;
  } else {
    return false;
  }
}

////////////////////////////////
// Render Function
  void render(){
    //fill(255,0,0);
    //rect(x,y,w,h);
   if(isInButton() == false){
    image(i,x,y);
   }
   if(isInButton() == true){
     image(ho,x,y);
   }
    
  }
}
