class Mushroom {
  //vars
  float x;
  float y;
  float size;

  int left;
  int right;
  int top;
  int bottom;

  int type;



  //constructor
  Mushroom(int t, float startX, float startY) {
    rectMode(CENTER);

    x = startX;
    y = startY;
    size = 30;
    type = t;

    left = int(x - size/2);
    right = int(x + size/2);
    top = int(y - size/2);
    bottom = int(y + size/2);
  }

  void render() {
    if (type == 1) {
      image(mushroom1, x-xOffset, y);
    }
    if (type == 2) {
      image(mushroom2, x-xOffset, y);
    }
    if (type == 3) {
      image(mushroom3, x-xOffset, y);
    }
    left = int(x - size/2);
    right = int(x + size/2);
    top = int(y - size/2);
    bottom = int(y + size/2);
  }

  //  void collideWithPlayer(Witch aWitch) {
  //  if (left < aWitch.right &&
  //    right > aWitch.left &&
  //    top < aWitch.bottom &&
  //    bottom > aWitch.top) {
  // println("Pickup mushroom" + type + '?');
  //  }
  //}

  void disapear() {
    y = height + 1000;
  }

  void collideWithPlayer(Witch aWitch) {
    if (left < aWitch.right &&
      right > aWitch.left &&
      top < aWitch.bottom &&
      bottom > aWitch.top) {
      println("Pickup Mushroom" + type + '?');
      if (type == aWitch.recipe.mushroomType) {
        if (isPickingUp == true) {
          disapear ();
          aWitch.isHoldingRightMushroom = true;
        }
      } 
      else if (isPickingUp == true) {
        disapear();
      }
    }
  }
}//CLOSES CLASS *NOTHING PAST HERE*
