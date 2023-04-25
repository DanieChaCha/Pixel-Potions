class Flower {
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
  Flower(int t, float startX, float startY) {
    rectMode(CENTER);

    x = startX;
    y = startY;
    size = 20;
    type = t;

    left = int(x - size/2);
    right = int(x + size/2);
    top = int(y - size/2);
    bottom = int(y + size/2);
  }

  void render() {
    if (type == 1) {
      image(flower1, (int(x-xOffset)), int(y));
    } else if (type == 2) {
      image(flower2, (int(x-xOffset)), int(y));
    } else if (type == 3) {
      image(flower3, (int(x-xOffset)), int(y));
    }
  }


  void disapear() {
    y = height + 1000;
  }



  void collideWithPlayer(Witch aWitch) {
    if (left < aWitch.right &&
      right > aWitch.left &&
      top < aWitch.bottom &&
      bottom > aWitch.top) {
      println("Pickup flower" + type + '?');
      if (type == aWitch.recipe.flowerType) {
        if (isPickingUp == true) {
          disapear();
          aWitch.isHoldingRightFlower = true;
        }
      }
      else if (isPickingUp == true) {
        disapear();
      }
    }
  }
}//CLOSES CLASS *NOTHING PAST HERE*
