class Obstacle {

  int x;
  int y;
  int w;
  int h;

  int right;
  int left;
  int top;
  int bottom;

  //constructor

  Obstacle(int startX, int startY, int startW, int startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;

    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }

  void render() {
    image(sign,x-xOffset,height - 110);
  } 
  
  void collideWithPlayer(Witch aWitch) {
    if (left <= aWitch.right &&
      right >= aWitch.left &&
      top <= aWitch.bottom &&
      bottom >= aWitch.top) {
        if(state == 3){
        w1.isMovingRight = false;
        }
        else if(state == 4){
          w1.isMovingLeft = false;
        }
      }
  }
}//************************************
