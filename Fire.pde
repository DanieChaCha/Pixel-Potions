class Fire{
  
  // vars
  
  int x;
  int y;
  int d;
  
  boolean shouldRemove;
  
  int left;
  int right;
  int top;
  int bottom;
  
  int startTime;
  int currentTime;
  int interval = 700;
  
  

  
  //constructor
  
 Fire(int startX, int startY){
   x = startX;
   y = startY;
   d = 300;
   
   shouldRemove = false;
     startTime = millis(); //start of timer
     
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
 }
 
 void collideWithEnemy(Enemy aEnemy) {
    if (left <= aEnemy.right &&
      right >= aEnemy.left &&
      top <= aEnemy.bottom &&
      bottom >= aEnemy.top) {
        aEnemy.shouldRemove = true;
      }
 }
 
 void render(){
   //noFill();
   //circle(x-xOffset,y,d);
 }
 
 void checkRemove(){
currentTime = millis();

if(currentTime - startTime > interval){
  shouldRemove = true;
  startTime = millis();
  w1.isAttacking = false;
  {
 }
 

  
}
}
}
//ENDS CLASS *******************************
