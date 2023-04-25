class Recipe {


  int bugType;
  int flowerType;
  int mushroomType;
  int type;

  int neededFlowers = 2;
  int neededBugs = 2;
  int neededMushrooms = 2;

  boolean isRecipeComplete;

  Recipe(int t) {
    type = t;
    if (t == 1) {
      bugType = 1;
      flowerType = 1;
      mushroomType = 1;
    }
    if (t == 2) {
      bugType = 2;
      flowerType = 2;
      mushroomType = 2;
    }
    if (t == 3) {
      bugType = 3;
      flowerType = 3;
      mushroomType = 3;
    }
  }
}//ENDS CLASS****************
