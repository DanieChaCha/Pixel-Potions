class Enemy {
  //vars
  int x;
  int y;
  int size;

  int left;
  int right;
  int top;
  int bottom;
  
  int leftX;
  int rightX;
  
  int speed = 2;
  boolean isMovingLeft = false;
  boolean isMovingRight = true;
  
  int health = 50;
  
  boolean shouldRemove;
  boolean isColliding;
  
  Animation mR;
  Animation mL;
  Animation aR;
  Animation aL;
  Animation dR;
  Animation dL;

  //constructor
  Enemy(int startX, int startY, Animation moveR, Animation moveL, Animation attackR, Animation attackL, Animation dieR, Animation dieL) {

    x = startX;
    y = startY;
    leftX = x;
    rightX = x + int(random(40,100));
    size = 20;

    left = x - size/2;
    right = x + size/2;
    top = y - size/2;
    bottom = y + size/2;
    
    shouldRemove = false;
    mR = moveR;
    mL = moveL;
    aR = attackR;
    aL = attackL;
    dR = dieR;
    dL = dieL;
  }

  void render() {
   if(isMovingRight == true && isColliding == false){
     mR.isAnimating = true;
     mR.display(int(x-xOffset),y);
   }
      if(isMovingLeft == true && isColliding == false){
     mL.isAnimating = true;
     mL.display(int(x-xOffset),y);
   }
   if(isMovingRight == true && isColliding == true){
     aR.isAnimating = true;
     aR.display(int(x-xOffset),y);
   }
    if(isMovingLeft == true && isColliding == true){
     aL.isAnimating = true;
     aL.display(int(x-xOffset),y);
   }
   if(isMovingRight == true && health <= 0){
     dR.isAnimating = true;
     dR.display(int(x-xOffset),y);
   }
    if(isMovingLeft == true && health <= 0){
     dL.isAnimating = true;
     dL.display(int(x-xOffset),y);
   }
   
  }
  
  void checkRemove(){
    if(health <= 0 && dL.isFinished == true || health <=0 && dR.isFinished == true){
      shouldRemove = true;
    }
  }

  void collideWithPlayer(Witch aWitch) {
    
    if (left < aWitch.right &&
      right > aWitch.left &&
      top < aWitch.bottom &&
      bottom > aWitch.top) {

     println("Take Damage");
     w1.health = w1.health - 1;
     w1.isHurt = true;
     isColliding = true;
    }
    else{ w1.isHurt = false;
    isColliding = false;
    }
  }
  
   void moveLeft() {
    x = x - speed;
  }
  void moveRight() {
    x = x + speed;
  }
  
   void move() {
    if (x >= rightX){
      isMovingRight = false;
      isMovingLeft = true;
    }
    if( x <= leftX){
      isMovingRight = true;
      isMovingLeft = false;
    } 
    if(isMovingRight == true) {
      moveRight();
    }
    if (isMovingLeft == true) {
      moveLeft();
    }
    left = x - size/2;
    right = x + size/2;
    top = y - size/2;
    bottom = y + size/2;
    //updates hit box
  }
}//CLOSES CLASS
