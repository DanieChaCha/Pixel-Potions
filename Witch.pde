class Witch {
  //Class Variables
  int x;
  int y;
  int w;
  int h;
  color c;

  int speed = 7;
  int jumpSpeed = 5;
  int jumpHeight; // distance you can jump up
  int heighestY; // y of top of jump

  boolean isFacingRight;
  boolean isFacingLeft;
  boolean isMovingRight;
  boolean isMovingLeft;
  boolean isJumping;
  boolean isFalling;
  boolean isAttacking;
  boolean isHurt;
  boolean isDead;

  int left;
  int right;
  int top;
  int bottom;

  int health = 270;

  Recipe recipe;

  boolean isHoldingRightBug = false;
  boolean isHoldingRightFlower = false;
  boolean isHoldingRightMushroom = false;

  //Constructor

  Witch(int startX, int startY, int wid, int hei, color col, Animation iR,
    Animation iL
    // ,Animation wR, Animation wL, Animation aR, Animation aL,
    //Animation jR, Animation jL
    ) {
    x = startX;
    y = startY;
    w = wid;
    h = hei;
    c = col;

    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    //initializes hit box

    isFacingRight= true;
    isFacingLeft = false;

    isMovingRight = false;
    isMovingLeft = false;
    isJumping = false;
    isFalling = false;
    isAttacking = false;
    isHurt = false;

    jumpHeight = 150;
    heighestY = y - jumpHeight;

    recipe = new Recipe(int(random(1, 4)));

    idleRAnimation = iR;
    idleLAnimation = iL;
  }
  //Render

  void render() {
    rectMode(CENTER);

    if (health <= 0) {
      if (isFacingRight == true && dieRAnimation.isFinished == false) {
        dieRAnimation.isAnimating = true;
        dieRAnimation.display(int(x-xOffset), y);
      } else if (isFacingLeft == true && dieLAnimation.isFinished == false) {
        dieLAnimation.isAnimating = true;
        dieLAnimation.display(int(x-xOffset), y);
      }
      }
    if (health<=0) {
        if (isFacingRight == true && dieRAnimation.isFinished == true) {
          image(deadR, int(x-xOffset), y);
        } else if (isFacingLeft == true && dieLAnimation.isFinished == true) {
          image(deadL, int(x-xOffset), y);
        }
      }



      if (isAttacking == true) {
        if (isFacingRight == true) {
          attackRAnimation.isAnimating = true;
          attackRAnimation.display(int(x-xOffset), y);
          println("attack animation right");
          //isAttacking = false;
        } else if (isFacingLeft == true) {
          attackLAnimation.isAnimating = true;
          attackLAnimation.display(int(x-xOffset), y);
          println("attack animation left");
          //isAttacking = false;
        }
      } else if (isHurt == true) {
        if (isFacingRight == true) {
          hurtRAnimation.isAnimating = true;
          hurtRAnimation.display(int(x-xOffset), y);
        } else if (isFacingLeft == true) {
          hurtLAnimation.isAnimating = true;
          hurtLAnimation.display(int(x-xOffset), y);
        }
      }

      if (isPickingUp == true) {
        if (isFacingRight == true) {
          pickupRAnimation.isAnimating = true;
          pickupRAnimation.display(int(x-xOffset), y);
        } else if (isFacingLeft == true) {
          pickupLAnimation.isAnimating = true;
          pickupLAnimation.display(int(x-xOffset), y);
        }
      }

      if (isFalling == true) {
        if (isFacingRight == true) {
          idleRAnimation.isAnimating = true;
          idleRAnimation.display(int(x-xOffset), y);
        }
        if (isFacingLeft == true) {
          idleLAnimation.isAnimating = true;
          idleLAnimation.display(int(x-xOffset), y);
        }
      } else if (isMovingRight == false
        && isMovingLeft == false && isJumping == false
        && isAttacking == false && isHurt == false && health > 0 && isPickingUp == false) {
        if (isFacingRight == true) {
          idleRAnimation.isAnimating = true;
          idleRAnimation.display(int(x-xOffset), y);
        } else if (isFacingLeft == true) {
          idleLAnimation.isAnimating = true;
          idleLAnimation.display(int(x-xOffset), y);
        }
      } else if (isJumping == false && isFalling == false) {
        if (isMovingRight == true) {
          walkRAnimation.isAnimating = true;
          walkRAnimation.display(int(x-xOffset), y);
        }
        if (isMovingLeft == true) {
          walkLAnimation.isAnimating = true;
          walkLAnimation.display(int(x-xOffset), y);
        }
      } else if (isJumping == true) {
        if (isFacingRight == true) {
          jumpRAnimation.isAnimating = true;
          jumpRAnimation.display(int(x-xOffset), y);
        } else if (isFacingLeft == true) {
          jumpLAnimation.isAnimating = true;
          jumpLAnimation.display(int(x-xOffset), y);
        }
      }
    }

    //////////////////////////////////////////////////
    // Move Functions

    void moveLeft() {
      x = x - speed;
    }
    void moveRight() {
      x = x + speed;
    }

    void facing() {
      if (isMovingRight == true) {
        isFacingRight = true;
        isFacingLeft = false;
      }
      if (isMovingLeft == true) {
        isFacingRight = false;
        isFacingLeft = true;
      }
    }


    void move() {
      if (isMovingRight == true) {
        moveRight();
        isFacingRight = true;
        isFacingLeft = false;
      }
      if (isMovingLeft == true) {
        moveLeft();
        isFacingRight = false;
        isFacingLeft = true;
      }
      left = x - w/2;
      right = x + w/2;
      top = y - h/2;
      bottom = y + h/2;
      //updates hit box
    }


    ////////////////////////////////////////////////
    // Jump Functions

    void jump() {
      if (isJumping == true) {
        y -= jumpSpeed;
      }
    }

    void fall() {
      if (isFalling == true) {
        y += jumpSpeed;
      }
    }

    void topOfJump() {
      if ( y <= heighestY ) {
        isJumping = false;
        isFalling = true;
      }
    }

    void land() {
      if (y >= height - 200) {
        isFalling = false;
        y = height - 200; //snap player to bottom
      }
    }

    void setLeft() {
      x = 100;
    }

    void setRight() {
      x = width - 100;
    }
  }
