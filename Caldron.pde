class Caldron {

  int x;
  int y;
  int w;
  int h;

  int right;
  int left;
  int top;
  int bottom;


  Caldron(int startX, int startY, int wid, int hei) {
    rectMode(CENTER);

    x = startX;
    y = startY;
    w = wid;
    h = hei;

    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }

  void render() {

    cauldronAnimation.isAnimating = true;
    cauldronAnimation.display(x, y);
  }


  void collideWithPlayer(Witch aWitch) {
    //println(aWitch.isHoldingRightBug);
    if (left < aWitch.right &&
      right > aWitch.left &&
      top < aWitch.bottom &&
      bottom > aWitch.top && aWitch.isHoldingRightBug == true) {
      aWitch.recipe.neededBugs -= 1;
      aWitch.isHoldingRightBug = false;
      println("Bug Accepted");
    }
    if (left < aWitch.right &&
      right > aWitch.left &&
      top < aWitch.bottom &&
      bottom > aWitch.top && aWitch.isHoldingRightFlower == true) {
      aWitch.recipe.neededFlowers -= 1;
      aWitch.isHoldingRightFlower = false;
      println("Flower Accepted");
    }
    if (left < aWitch.right &&
      right > aWitch.left &&
      top < aWitch.bottom &&
      bottom > aWitch.top && aWitch.isHoldingRightMushroom == true) {
      aWitch.recipe.neededMushrooms -= 1;
      aWitch.isHoldingRightMushroom = false;
      println("Mushroom Accepted");
    }
  }
}//closes class ***********
