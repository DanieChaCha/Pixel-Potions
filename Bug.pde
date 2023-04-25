class Bug {
  //vars
  float x;
  float y;
  float size;

  int left;
  int right;
  int top;
  int bottom;

  int type;

  int speed;

  boolean isMovingRight;
  boolean isMovingLeft;
  
  int rightX;
  int leftX;

  //constructor
  Bug(int t, float startX, float startY) {
    rectMode(CENTER);

    x = startX;
    y = startY;
    size = 20;
    type = t;
    leftX = int(x);
    rightX = int(x + int(random(100,2000)));

    left = int(x - size/2);
    right = int(x + size/2);
    top = int(y - size/2);
    bottom = int(y + size/2);

    isMovingRight = true;
    isMovingLeft = false;
    
    if(type == 3) {
      y = startY - int(random(70,200));
    }
    
        if(type == 2) {
      y = startY - 70;
    }
       if(type == 1) {
      y = startY - int(random(100,250));
    }
  }

  void render() {
    if (type == 1){
      spiderAnimation.isAnimating = true;
      spiderAnimation.display(int(x-xOffset), int(y));
    }
    if (type == 2){
       wormAnimation.isAnimating = true;
     wormAnimation.display(int(x-xOffset), int(y));
    }
    if (type == 3){ 
      if(isMovingRight == true){
     butterflyRAnimation.isAnimating = true;
      butterflyRAnimation.display(int(x-xOffset), int(y));
      }
        else if(isMovingLeft == true){
     butterflyLAnimation.isAnimating = true;
      butterflyLAnimation.display(int(x-xOffset), int(y));
      }
    }
  }






  /////////////////////////////////////////
  // MOVING
   void move() {
     
    if(type == 3){
      fast();
    }
    if(type == 2){
      slow();
    }
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
    left = int(x - size/2);
    right = int(x + size/2);
    top = int(y - size/2);
    bottom = int(y + size/2);
    //updates hit box
  }


  void fast() {
    speed = 2;
  }

  void slow() {
    speed = 1;
  }

  void moveLeft() {
    x = x - speed;
  }
  void moveRight() {
    x = x + speed;
  }
  void disapear() {
    y = height + 1000;
  }

  void collideWithPlayer(Witch aWitch) {
    if (left < aWitch.right &&
      right > aWitch.left &&
      top < aWitch.bottom &&
      bottom > aWitch.top) {
      println("Pickup bug" + type + '?');
      if (type == aWitch.recipe.bugType) {
        if (isPickingUp == true) {
          disapear();
          aWitch.isHoldingRightBug = true;
        }
      }
      else if(isPickingUp == true){
        disapear();
      }
    }
  }
}//CLOSES CLASS *NOTHING PAST HERE*
