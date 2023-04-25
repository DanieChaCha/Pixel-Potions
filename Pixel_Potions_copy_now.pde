//////////////////////////////////////
//This is Pixel Potions, a game created by Danielle Charles. Don't change anything, it works.
//////////////////////////////////////
// Sounds
import processing.sound.*;
SoundFile backgroundMusic;
SoundFile steps;
SoundFile button;
SoundFile forest;

/////////////////////////////////////
// Pictures
Animation titleAnimation;
PImage[] titleImages = new PImage[8];

PImage titleBackground;

PImage playButtonPurple;
PImage playButtonGreen;
PImage creditsButtonPurple;
PImage creditsButtonGreen;
PImage quitButtonPurple;
PImage quitButtonGreen;
PImage playAgainPurple;
PImage playAgainGreen;

PImage scrollSmall;

Animation flyAnimation;
PImage[] flyImages = new PImage[4];

/////// WITCH ANIMATIONS

Animation idleRAnimation;
PImage[] iRImages = new PImage[4];

Animation idleLAnimation;
PImage[] iLImages = new PImage[4];

Animation walkRAnimation;
PImage[] wRImages = new PImage[4];

Animation walkLAnimation;
PImage[] wLImages = new PImage[4];

Animation jumpRAnimation;
PImage[] jRImages = new PImage[4];

Animation jumpLAnimation;
PImage[] jLImages = new PImage[4];

Animation attackRAnimation;
PImage[] aRImages = new PImage[8];

Animation attackLAnimation;
PImage[] aLImages = new PImage[8];

Animation hurtRAnimation;
PImage[] hRImages = new PImage[4];

Animation hurtLAnimation;
PImage [] hLImages = new PImage[4];

Animation pickupRAnimation;
PImage[] pRImages = new PImage[5];

Animation pickupLAnimation;
PImage[] pLImages = new PImage[5];

Animation dieRAnimation;
PImage[] dieRImages = new PImage[10];

Animation dieLAnimation;
PImage[] dieLImages = new PImage[10];

PImage deadR;
PImage deadL;



/////////////////
// HOME AND BACKGROUNDS

Animation cauldronAnimation;
PImage[] cauldronImages = new PImage[6];

PImage home;
PImage field;
PImage cave;
PImage scroll;
PImage fieldPath;
PImage cavePath;

PImage credits;

////////////////////////////
// INGREDIENTS

Animation butterflyRAnimation;
PImage [] butterflyRImages = new PImage[2];

Animation butterflyLAnimation;
PImage [] butterflyLImages = new PImage[2];

Animation spiderAnimation;
PImage [] spiderImages = new PImage[2];

Animation wormAnimation;
PImage [] wormImages = new PImage[2];

Animation batMoveR;
PImage [] batMoveRImages = new PImage[5];

Animation batMoveL;
PImage [] batMoveLImages = new PImage[5];

Animation batDieR;
PImage [] batDieRImages = new PImage[6];

Animation batDieL;
PImage [] batDieLImages = new PImage[6];

Animation snakeMoveR;
PImage[] snakeMoveRImages = new PImage[8];

Animation snakeMoveL;
PImage [] snakeMoveLImages = new PImage[8];

Animation snakeAttackR;
PImage [] snakeAttackRImages = new PImage[14];

Animation snakeAttackL;
PImage [] snakeAttackLImages = new PImage[14];

Animation snakeDieR;
PImage [] snakeDieRImages = new PImage[6];

Animation snakeDieL;
PImage [] snakeDieLImages = new PImage[6];


PImage flower1;
PImage flower2;
PImage flower3;

PImage mushroom1;
PImage mushroom2;
PImage mushroom3;

PImage healthBar;

PImage recipe1;
PImage recipe2;
PImage recipe3;

PImage sign;
/// fonts

PFont pixelFont;
PFont pixelFontBig;



/////////////////////////////////////

Witch w1;

Obstacle o1;
Obstacle o2;

Mushroom m1;
Flower f1;
Bug b1;

Caldron c1;

Fire fire1;

Button but1;
Button but2;
Button but3;
Button but4;
Button but5;

ArrayList<Mushroom> mushroomList;
ArrayList<Flower> flowerList;
ArrayList<Enemy> enemyList3;
ArrayList<Enemy> enemyList4;
ArrayList<Bug> bugList3;
ArrayList<Bug> bugList4;
ArrayList<Fire> fireList;
ArrayList<Button> buttonList;


///////////////////////////
// IS PICKING UP
boolean isPickingUp = false;

////////////////////////////////////
//State
int state = 0;

///////////////////////////////////
float xOffset;
int stageW = 7500;

void setup() {
  size(1200, 800);
  background(42);
  rectMode(CENTER);



  /////////////////////////////////////////
  // PICTURES

  ///TITLE SCREEN

  imageMode(CENTER);
  titleBackground = loadImage("background.jpg");
  titleBackground.resize(1200, 800);

  for (int index=0; index<8; index++) {
    titleImages[index] = loadImage("title_" + index + ".png");
  }
  titleAnimation = new Animation(titleImages, 0.2, 2);

  playButtonPurple = loadImage("playButtonPurple.png");
  playButtonPurple.resize(int(playButtonPurple.width * 0.5),
    int(playButtonPurple.height * 0.5));

  playButtonGreen = loadImage("playButtonGreen.png");
  playButtonGreen.resize(int(playButtonGreen.width * 0.5),
    int(playButtonGreen.height * 0.5));

  creditsButtonPurple = loadImage("creditsButtonPurple.png");
  creditsButtonPurple.resize(int(creditsButtonPurple.width * 0.4),
    int(creditsButtonPurple.height * 0.4));
  creditsButtonGreen = loadImage("creditsButtonGreen.png");
  creditsButtonGreen.resize(int(creditsButtonGreen.width * 0.4),
    int(creditsButtonGreen.height * 0.4));

  quitButtonPurple = loadImage("quitButtonPurple.png");
  quitButtonPurple.resize(int(quitButtonPurple.width * 0.4),
    int(quitButtonPurple.height * 0.35));
  quitButtonGreen = loadImage("quitButtonGreen.png");
  quitButtonGreen.resize(int(quitButtonGreen.width * 0.4),
    int(quitButtonGreen.height * 0.35));

  playAgainPurple = loadImage("playAgainPurple.png");
  playAgainPurple.resize(int(playAgainPurple.width * 0.5),
    int(playAgainPurple.height * 0.5));

  playAgainGreen = loadImage("playAgainGreen.png");
  playAgainGreen.resize(int(playAgainGreen.width * 0.5),
    int(playAgainGreen.height * 0.5));

  for (int index=0; index<4; index++) {
    flyImages[index] = loadImage("witchFly" + index + ".png");
  }
  flyAnimation = new Animation(flyImages, 0.2, 1.5);

  ////////// WITCH IMAGES

  for (int index=0; index<4; index++) {
    iRImages[index] = loadImage("iR" + index + ".png");
  }
  idleRAnimation = new Animation(iRImages, 0.1, 1);

  for (int index=0; index<4; index++) {
    iLImages[index] = loadImage("iL" + index + ".png");
  }
  idleLAnimation = new Animation(iLImages, 0.1, 1);

  for (int index=0; index<4; index++) {
    wRImages[index] = loadImage("wR" + index + ".png");
  }
  walkRAnimation = new Animation(wRImages, 0.2, 1);

  for (int index=0; index<4; index++) {
    wLImages[index] = loadImage("wL" + index + ".png");
  }
  walkLAnimation = new Animation(wLImages, 0.2, 1);

  for (int index=0; index<4; index++) {
    jRImages[index] = loadImage("jR" + index + ".png");
  }
  jumpRAnimation = new Animation(jRImages, 0.1, 1);

  for (int index=0; index<4; index++) {
    jLImages[index] = loadImage("jL" + index + ".png");
  }
  jumpLAnimation = new Animation(jLImages, 0.1, 1);

  for (int index=0; index<8; index++) {
    aRImages[index] = loadImage("aR" + index + ".png");
  }
  attackRAnimation = new Animation(aRImages, 0.2, 1);

  for (int index=0; index<8; index++) {
    aLImages[index] = loadImage("aL" + index + ".png");
  }
  attackLAnimation = new Animation(aLImages, 0.2, 1);

  for (int index=0; index<4; index++) {
    hRImages[index] = loadImage("hR" + index + ".png");
  }
  hurtRAnimation = new Animation(hRImages, 0.2, 1);

  for (int index=0; index<4; index++) {
    hLImages[index] = loadImage("hL" + index + ".png");
  }
  hurtLAnimation = new Animation(hLImages, 0.2, 1);

  for (int index=0; index<5; index++) {
    pRImages[index] = loadImage("pR" + index + ".png");
  }
  pickupRAnimation = new Animation(pRImages, 0.2, 1);

  for (int index=0; index<5; index++) {
    pLImages[index] = loadImage("pL" + index + ".png");
  }
  pickupLAnimation = new Animation(pLImages, 0.2, 1);

  for (int index=0; index<10; index++) {
    dieRImages[index] = loadImage("dR" + index + ".png");
  }
  dieRAnimation = new Animation(dieRImages, 0.2, 1);

  for (int index=0; index<10; index++) {
    dieLImages[index] = loadImage("dL" + index + ".png");
  }
  dieLAnimation = new Animation(dieLImages, 0.2, 1);

  deadR = loadImage("deadR.png");
  deadL = loadImage("deadL.png");
  
  
  /////////////////////////////////////////////////////
  ///// INGREDIENTS

  for (int index=0; index<2; index++) {
    butterflyRImages[index] = loadImage("butterflyR" + index + ".png");
  }
  butterflyRAnimation = new Animation(butterflyRImages, 0.01, 0.6);

  for (int index=0; index<2; index++) {
    butterflyLImages[index] = loadImage("butterflyL" + index + ".png");
  }
  butterflyLAnimation = new Animation(butterflyLImages, 0.01, 0.6);

  for (int index=0; index<2; index++) {
    spiderImages[index] = loadImage("spider" + index + ".png");
  }
  spiderAnimation = new Animation(spiderImages, 0.01, 1);

  for (int index=0; index<2; index++) {
    wormImages[index] = loadImage("worm" + index + ".png");
  }
  wormAnimation = new Animation(wormImages, 0.01, 0.5);
  
  
  //////ENEMIES 
    for (int index=0; index<5; index++) {
    batMoveRImages[index] = loadImage("batMR" + index + ".png");
  }
  batMoveR = new Animation(batMoveRImages, 0.01, 1);
  
      for (int index=0; index<5; index++) {
    batMoveLImages[index] = loadImage("batML" + index + ".png");
  }
  batMoveL = new Animation(batMoveLImages, 0.01, 1);
  
  for (int index=0; index<6; index++) {
    batDieRImages[index] = loadImage("batDR" + index + ".png");
  }
  batDieR = new Animation(batDieRImages, 0.01, 1);
  
    for (int index=0; index<6; index++) {
    batDieLImages[index] = loadImage("batDL" + index + ".png");
  }
  batDieL = new Animation(batDieLImages, 0.01, 1);
   
  for (int index=0; index<8; index++) {
    snakeMoveRImages[index] = loadImage("snakeMR" + index + ".png");
  }
  snakeMoveR = new Animation(snakeMoveRImages, 0.01, 1);
  
  for (int index=0; index<8; index++) {
    snakeMoveLImages[index] = loadImage("snakeML" + index + ".png");
  }
  snakeMoveL = new Animation(snakeMoveLImages, 0.01, 1);

  for (int index=0; index<14; index++) {
    snakeAttackRImages[index] = loadImage("snakeAR" + index + ".png");
  }
  snakeAttackR = new Animation(snakeAttackRImages, 0.01, 1);
  
    for (int index=0; index<14; index++) {
    snakeAttackLImages[index] = loadImage("snakeAL" + index + ".png");
  }
  snakeAttackL = new Animation(snakeAttackLImages, 0.01, 1);
  
    for (int index=0; index<6; index++) {
    snakeDieRImages[index] = loadImage("snakeDR" + index + ".png");
  }
  snakeDieR = new Animation(snakeDieRImages, 0.01, 1);
  
  for (int index=0; index<6; index++) {
    snakeDieLImages[index] = loadImage("snakeDL" + index + ".png");
  }
  snakeDieL = new Animation(snakeDieLImages, 0.01, 1);

  flower1 = loadImage("flower1.png");
  flower2 = loadImage("flower2.png");
  flower3 = loadImage("flower3.png");

  mushroom1 = loadImage("mushroom1.png");
  mushroom1.resize(int(mushroom1.width * 0.7),
    int(mushroom1.height * 0.7));
  mushroom2 = loadImage("mushroom2.png");
  mushroom2.resize(int(mushroom2.width * 0.7),
    int(mushroom2.height * 0.7));
  mushroom3 = loadImage("mushroom3.png");
  mushroom3.resize(int(mushroom3.width * 0.7),
    int(mushroom3.height * 0.7));

  healthBar = loadImage("healthBar.png");

  recipe1 = loadImage("recipe1.png");
  recipe1.resize(1200, 800);
  recipe2 = loadImage("recipe2.png");
  recipe2.resize(1200, 800);
  recipe3 = loadImage("recipe3.png");
  recipe3.resize(1200, 800);

  sign = loadImage("sign.png");



  /////////////////////////// HOME AND BACKGROUNDS
  for (int index=0; index<6; index++) {
    cauldronImages[index] = loadImage("cauldron" + index + ".png");
  }
  cauldronAnimation = new Animation(cauldronImages, 0.1, 1);

  home = loadImage("home.png");
  field = loadImage("field.png");
  field.resize((int(field.width * 0.75)), (int(field.height * 0.75)));
  cave = loadImage("cave.png");
  cave.resize((int(cave.width*.7)), (int(cave.height*.7)));
  cavePath = loadImage("cavePath.png");

  scroll = loadImage("scroll.png");
  scroll.resize((int(scroll.width * 0.6)), (int(scroll.height * 0.6)));

  credits = loadImage("credits.png");
  credits.resize(1200, 800);

  scrollSmall = loadImage("scrollSmall.png");

  fieldPath = loadImage("fieldPath.png");



  mushroomList = new ArrayList<Mushroom>();
  enemyList3 = new ArrayList<Enemy>();
  enemyList4 = new ArrayList<Enemy>();
  flowerList = new ArrayList<Flower>();
  bugList3 = new ArrayList<Bug>();
  bugList4 = new ArrayList<Bug>();
  fireList = new ArrayList<Fire>();

  ///////////////////////////////////
  //ECT
  w1 = new Witch(3*width/4, height -200, 200, 200, color(244, 149, 249), idleRAnimation, idleLAnimation);
  m1 = new Mushroom(2, 350, height-25);
  f1 = new Flower(2, 450, height-25);
  c1 = new Caldron(width/2, height - 150, 200, 200);
  fire1 = new Fire (w1.x, w1.y);
  o1 = new Obstacle(stageW + 400, height/2, 100, 700);
  o2 = new Obstacle(50, height/2, 100, 700);

  but1 = new Button(width/4, height/2 - 50, 446, 140, playButtonPurple, playButtonGreen);
  but2 = new Button(width/4, height/2 + 100, 446, 140, creditsButtonPurple, creditsButtonGreen);
  but3 = new Button(width/4, height/2 + 250, 446, 140, quitButtonPurple, quitButtonGreen);
  but4 = new Button(width/2, height - 100, 446, 140, quitButtonPurple, quitButtonGreen);
  but5 = new Button(width/2, height - 300, 446, 140, playAgainPurple, playAgainGreen);


  ///////////////////////////////////////////////////////
  ////// POPULATING ARRAY LISTS

  for (int n = 0; n < 6; n = n+1) {
    enemyList3.add(new Enemy(int(random(200, stageW)-xOffset), height - int(random(150, 180)), snakeMoveR, snakeMoveL , snakeAttackR, snakeAttackL, snakeDieR, snakeDieL));
  }

  for (int n = 0; n < 6; n = n+1) {
    enemyList4.add(new Enemy(int(random(0, stageW)-xOffset), height - int(random(200,230 )), batMoveR, batMoveL, batMoveR, batMoveL, batDieR, batDieL));
  }

  for (int n = 0; n < 4; n = n+1) {
    bugList3.add(new Bug(3, int(random(300, stageW)-xOffset), height -50));
    bugList3.add(new Bug(2, int(random(300, stageW)-xOffset), height -50));
  }

  for (int n = 0; n < 4; n = n+1) {
    bugList4.add(new Bug(2, int(random(300, stageW - 200)-xOffset), height -50));
    bugList4.add(new Bug(1, int(random(300, stageW - 200)-xOffset), height -50));
  }

  for (int n = 0; n < 3; n = n+1) {
    mushroomList.add(new Mushroom (int(random(1, 4)), (random(0, 7500)-xOffset), float(height -100)));
    mushroomList.add(new Mushroom (w1.recipe.type, (random(0, stageW)-xOffset), float(height -100)));
  }

  for (int n = 0; n < 4; n = n+1) {
    flowerList.add(new Flower (int(random(1, 4)), (random(300, 7500)-xOffset), float(height -100)));
    flowerList.add(new Flower (w1.recipe.type, (random(300, stageW)-xOffset), float(height - 100)));
  }


  ///////////////////////////////////////
  // Sounds
  forest = new SoundFile(this, "forestsound.wav");
  button = new SoundFile(this, "button.wav");
  steps = new SoundFile(this, "crunchstep.mp3");
  backgroundMusic = new SoundFile(this, "melodytest3.wav");
  backgroundMusic.amp(0.2);
  steps.rate(3);
  steps.amp(0.3);
  button.amp(0.3);
  forest.amp(.3);

  /////////// fonts
  pixelFont = loadFont("Nine-By-Five-NBP-30.vlw");
  pixelFontBig = loadFont("Nine-By-Five-NBP-124.vlw");

  ///////////////////////////////////////
}






void draw() {
  background(42);
  if (backgroundMusic.isPlaying()==false) {
    backgroundMusic.play();
  }
  if (forest.isPlaying()==false) {
    forest.play();
  }



  /////////////////////////////////////
  // States
  /////////////////////////////////////
  //Start Screen
  switch(state) {
  case 0: //Title

    image(titleBackground, width/2, height/2);

    titleAnimation.isAnimating = true;
    titleAnimation.display(width/2, height/5);

    flyAnimation.isAnimating = true;
    flyAnimation.display(3*width/4, 2*height/3);

    but1.render();
    but2.render();
    but3.render();

    if (but1.isPressed() == true) {
      state = 1;
    }
    if (but2.isPressed() == true) {
      state = 5;
    }
    if (but3.isPressed() == true) {
      exit();
    }
    break;



  case 1: //GIVE RECIPE AND WALKING DIRECTIONS

    fill(255);
    textFont(pixelFontBig);
    textSize(60);
    String textB;
    if (w1.recipe.type == 1) {
      textB = "Oh wise and powerful witch, my son has fallen gravely ill. I beseech you to brew a healing potion to save his life.\n"+
        "  \n" +
        "You will need:\n" +
        "2 x Blue Flowers\n" +
        "2 x Spiders\n" +
        "2 x Red Mushrooms";
    } else  if (w1.recipe.type == 2) {
      textB = "Oh great witch, I have long pined for the affection of a certain person but they do not reciprocate my feelings. Can you brew a love potion to make them fall for me?\n"+
        "  \n" +
        "You will need:\n" +
        "2 x Purple Flowers\n" +
        "2 x Worms\n" +
        "2 x Green Mushrooms";
    } else {
      textB = "Oh skilled witch, I need to move undetected through the enemy's stronghold. Can you brew me an invisibility potion?\n"+
        "  \n" +
        "You will need:\n" +
        "2 x Orange Flowers\n" +
        "2 x Butterflies\n" +
        "2 x Blue Mushrooms";
    }
    text(textB, width/2, height/2, 600, 700);
    textAlign(CENTER);
    fill(255);
    textFont(pixelFont);
    textSize(60);
    text("Press Space to Continue", width/2, height - 50);
    break;

  case 8:
    fill(255);
    textFont(pixelFontBig);
    textSize(60);
    String text = "Remember you can only hold one of each\n" +
      "ingredient type at a time.\n" +
      "If you pick up two flowers at a time,\n" +
      "only one will make it to the cauldron.";
    text(text, width/2, height/2, 600, 600);
    text("Press Space to Continue", width/2, height - 50);


    break;




    //////////////////////////////////////////////////
  case 2: //HOME

    xOffset = 0;

    w1.isAttacking = false;

    image(field, width/2, height/2);
    image(home, width/2, height/2);
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(100, 75, w1.health, 50);
    image(healthBar, width/4 - 100, 100);



    if (w1.recipe.neededFlowers <= 0
      && w1.recipe.neededBugs <= 0
      && w1.recipe.neededMushrooms <= 0) {
      w1.recipe.isRecipeComplete = true;
      state = 7;
      println("winner");
    }

    println(w1.recipe.neededFlowers + " flowers");
    println(w1.recipe.neededBugs + " bugs");
    println(w1.recipe.neededMushrooms + " mushrooms");
    println(" ");


    /////////////////////////////////////
    // Witch Draw Stuff *~
    w1.render();
    w1.move();
    w1.jump();
    w1.fall();
    w1.topOfJump();
    w1.land();
    ////////

    float r = map(w1.recipe.neededFlowers, 3, 0, 0, 42);
    float g = map(w1.recipe.neededBugs, 3, 0, 0, 105);
    float b = map(w1.recipe.neededMushrooms, 3, 0, 0, 87);



    ellipseMode(CENTER);
    fill(r, g, b);
    ellipse(width/2, height - 110, 200, 100);



    c1.render();
    c1.collideWithPlayer(w1);


    if (w1.right >= width) {
      println("right");
      state = 3;
      w1.x = 10;// Right Field
    }
    if (w1.left <= 0) {
      w1.x = 8000;
      state = 4; //left cave
      //w1.y = height - 50;
    }

    /////////////////////////////////
    // Print Recipe
    image(scroll, 7*width/8, 100);

    textAlign(CENTER);
    fill(0);
    textSize(30);
    textFont(pixelFont);
    if (w1.recipe.type == 1) {
      String textBlock = w1.recipe.neededFlowers + " Blue Flowers\n"
        + w1.recipe.neededBugs +" Spiders\n"
        + w1.recipe.neededMushrooms + " Red Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }
    if (w1.recipe.type == 2) {
      String textBlock = w1.recipe.neededFlowers + " Purple Flowers\n"
        + w1.recipe.neededBugs +" Worms\n"
        + w1.recipe.neededMushrooms + " Green Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }

    if (w1.recipe.type == 3) {
      String textBlock = w1.recipe.neededFlowers + " Orange Flowers\n"
        + w1.recipe.neededBugs +" Butterflys\n"
        + w1.recipe.neededMushrooms + " Green Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }


    break;






    ///////////////////////////////////////////////////
  case 3: //RIGHT field
  
  println("bug" + bugList3.get(0).left);
  println("flower" + flowerList.get(0).left);
  println("witch" + w1.left);

    image(field, width/2, height/2);


    for (int i = 0; i < 9000; i = i + fieldPath.width) {
      int X =int(200 - xOffset) + i;
      image(fieldPath, int(X), height/2);
    }



    fill(255, 0, 0);
    rectMode(CORNER);
    rect(100, 75, w1.health, 50);
    image(healthBar, width/4 - 100, 100);

    xOffset = min(max(w1.x - (width/2), 0), stageW - 500);



    //////////////////////////////////////////////////
    // wall to keep you going off right side
    o1.render();
    o1.collideWithPlayer(w1);


    /////////////////////////////
    // Witch Draw Stuff *~
    w1.render();
    w1.move();
    w1.jump();
    w1.fall();
    w1.topOfJump();
    w1.land();
    
        for (Flower aFlower : flowerList) {
      aFlower.render();
      aFlower.collideWithPlayer(w1);
    }
    
    for (Bug aBug : bugList3) {
      aBug.render();
      aBug.collideWithPlayer(w1);
      aBug.move();
    }



    if (w1.x == 0) {
      w1.y = height - 50;
      state = 2;
      w1.setRight();
    }

    if (w1.health <= 0) {
      state = 6;
    }

    if (w1.left <= 0 && w1.isMovingLeft == true) {
      state = 2;
      w1.setRight();
    }



    
    for (Enemy aEnemy : enemyList3) {
      aEnemy.render();
      aEnemy.collideWithPlayer(w1);
      aEnemy.move();
      aEnemy.checkRemove();
    }
    
    for (int i = enemyList3.size() - 1; i >= 0; i --) {
      Enemy aEnemy = enemyList3.get(i);

      if (aEnemy.shouldRemove == true ) {
        enemyList3.remove(aEnemy);
      }
    }
    for (Fire aFire : fireList) {
      aFire.render();
      aFire.checkRemove();
      for (Enemy aEnemy : enemyList3) {
        aFire.collideWithEnemy(aEnemy);
      }
    }


    // for loop to remove attack
    for (int i = fireList.size() - 1; i >= 0; i --) {
      Fire aFire = fireList.get(i);

      if (aFire.shouldRemove == true ) {
        fireList.remove(aFire);
      }
    }

    /////////////////////////////////
    // Print Recipe

    image(scroll, 7*width/8, 100);

    rectMode(CENTER);
    textAlign(CENTER);
    fill(0);
    textSize(30);
    textFont(pixelFont);
    if (w1.recipe.type == 1) {
      String textBlock = w1.recipe.neededFlowers + " Blue Flowers\n"
        + w1.recipe.neededBugs +" Spiders\n"
        + w1.recipe.neededMushrooms + " Red Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }
    if (w1.recipe.type == 2) {
      String textBlock = w1.recipe.neededFlowers + " Purple Flowers\n"
        + w1.recipe.neededBugs +" Worms\n"
        + w1.recipe.neededMushrooms + " Green Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }

    if (w1.recipe.type == 3) {
      String textBlock = w1.recipe.neededFlowers + " Orange Flowers\n"
        + w1.recipe.neededBugs +" Butterflys\n"
        + w1.recipe.neededMushrooms + " Green Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }




    break;







    /////////////////////////////////////////////////////
  case 4: //LEFT CAVE

    for (int i = 0; i < 9000; i = i + cave.width) {
      int X =int(200 - xOffset) + i;
      image(cave, int(X), height/2);
    }
        for(int i = 0; i < 8500; i = i + cavePath.width){
      int X =int(200 - xOffset) + i;
      image(cavePath, int(X), height/2);
    }


    //image(cave, width/2, height/2);

    fill(255, 0, 0);
    rectMode(CORNER);
    rect(100, 75, w1.health, 50);
    image(healthBar, width/4 - 100, 100);

    xOffset = min(max(w1.x - (width/2), 0), stageW - 500);

    println(w1.x);
    println(xOffset);
    println(' ');

    o2.render();
    o2.collideWithPlayer(w1);
    
        for (Bug aBug : bugList4) {
      aBug.render();
      aBug.collideWithPlayer(w1);
      aBug.move();
    }


    /////////////////////////////////////
    // Witch Draw Stuff *~
    w1.render();
    w1.move();
    w1.jump();
    w1.fall();
    w1.topOfJump();
    w1.land();


    if (w1.x >= stageW + 600) {
      state = 2;
      w1.setLeft();
    }

    if (w1.health <= 0) {
      state = 6;
    }

    if (w1.bottom == height) {
      state = 6;
    }
    ////////////////////////////////////
    // Platform Render Stuff For loop

    for (Mushroom aMushroom : mushroomList) {
      aMushroom.render();
      aMushroom.collideWithPlayer(w1);
    }


    for (Enemy aEnemy : enemyList4) {
      aEnemy.render();
      aEnemy.collideWithPlayer(w1);
      aEnemy.move();
      aEnemy.checkRemove();
    }
    for (int i = enemyList4.size() - 1; i >= 0; i --) {
      Enemy aEnemy = enemyList4.get(i);

      if (aEnemy.shouldRemove == true ) {
        enemyList4.remove(aEnemy);
      }
    }
    for (Fire aFire : fireList) {
      aFire.render();
      aFire.checkRemove();
      for (Enemy aEnemy : enemyList4) {
        aFire.collideWithEnemy(aEnemy);
      }
    }


    // for loop to remove attack
    for (int i = fireList.size() - 1; i >= 0; i --) {
      Fire aFire = fireList.get(i);

      if (aFire.shouldRemove == true ) {
        fireList.remove(aFire);
      }
    }

    /////////////////////////////////
    // Print Recipe

    image(scroll, 7*width/8, 100);

    textAlign(CENTER);
    fill(0);
    textSize(30);
    textFont(pixelFont);
    if (w1.recipe.type == 1) {
      String textBlock = w1.recipe.neededFlowers + " Blue Flowers\n"
        + w1.recipe.neededBugs +" Spiders\n"
        + w1.recipe.neededMushrooms + " Red Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }
    if (w1.recipe.type == 2) {
      String textBlock = w1.recipe.neededFlowers + " Purple Flowers\n"
        + w1.recipe.neededBugs +" Worms\n"
        + w1.recipe.neededMushrooms + " Green Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }

    if (w1.recipe.type == 3) {
      String textBlock = w1.recipe.neededFlowers + " Orange Flowers\n"
        + w1.recipe.neededBugs +" Butterflys\n"
        + w1.recipe.neededMushrooms + " Green Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }

    break;

  case 5:
    image(credits, width/2, height/2);
    but4.render();

    if (but4.isPressed()) {
      state = 0;
    }


    break;

  case 6: // death

    w1.isMovingRight = false;
    w1.isMovingLeft = false;
    w1.isJumping = false;
    w1.isHurt = false;
    w1.render();



    but5.render();
    if (but5.isPressed()) {
      state = 0;
      w1.health = 270;
      w1.recipe.neededFlowers = 3;
      w1.recipe.neededMushrooms = 3;
      w1.recipe.neededBugs = 3;
    }

    image(scrollSmall, width/2, height/2 -30);


    textAlign(CENTER);
    fill(255, 0, 0);
    textFont(pixelFontBig);
    textSize(124);
    text("You died...", width/2, height/2);

    break;

  case 7:




    xOffset = 0;

    w1.isAttacking = false;

    image(field, width/2, height/2);
    image(home, width/2, height/2);
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(100, 75, w1.health, 50);
    image(healthBar, width/4 - 100, 100);



    if (w1.recipe.neededFlowers <= 0
      && w1.recipe.neededBugs <= 0
      && w1.recipe.neededMushrooms <= 0) {
      w1.recipe.isRecipeComplete = true;
      state = 7;
      println("winner");
    }

    println(w1.recipe.neededFlowers + " flowers");
    println(w1.recipe.neededBugs + " bugs");
    println(w1.recipe.neededMushrooms + " mushrooms");
    println(" ");


    /////////////////////////////////////
    // Witch Draw Stuff *~
    w1.isMovingRight = false;
    w1.isMovingLeft = false;
    w1.isJumping = false;
    w1.isHurt = false;
    w1.render();
    ////////

    float R = map(w1.recipe.neededFlowers, 3, 0, 0, 42);
    float G = map(w1.recipe.neededBugs, 3, 0, 0, 105);
    float B = map(w1.recipe.neededMushrooms, 3, 0, 0, 87);



    ellipseMode(CENTER);
    fill(R, G, B);
    ellipse(width/2, height - 110, 200, 100);



    c1.render();
    c1.collideWithPlayer(w1);


    if (w1.right >= width) {
      println("right");
      state = 3;
      w1.x = 10;// Right Field
    }
    if (w1.left <= 0) {
      w1.x = 8000;
      state = 4; //left cave
      //w1.y = height - 50;
    }

    /////////////////////////////////
    // Print Recipe
    image(scroll, 7*width/8, 100);

    textAlign(CENTER);
    fill(0);
    textSize(30);
    textFont(pixelFont);
    if (w1.recipe.type == 1) {
      String textBlock = w1.recipe.neededFlowers + " Blue Flowers\n"
        + w1.recipe.neededBugs +" Spiders\n"
        + w1.recipe.neededMushrooms + " Red Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }
    if (w1.recipe.type == 2) {
      String textBlock = w1.recipe.neededFlowers + " Purple Flowers\n"
        + w1.recipe.neededBugs +" Worms\n"
        + w1.recipe.neededMushrooms + " Green Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }

    if (w1.recipe.type == 3) {
      String textBlock = w1.recipe.neededFlowers + " Orange Flowers\n"
        + w1.recipe.neededBugs +" Butterflys\n"
        + w1.recipe.neededMushrooms + " Green Mushrooms";
      text(textBlock, 7*width/8, 150, 200, 200);
    }
    image(scrollSmall, width/2, height/2-30);
    textAlign(CENTER);
    fill(255);
    textFont(pixelFontBig);
    textSize(75);
    text("Potion Complete!", width/2, height/2 - 15);

    break;
  }
}//closes draw

void keyPressed() {
  //////////////////////////////////////
  // Witch Moving
  if (key == 'a') {
    w1.isMovingLeft = true;
    if (steps.isPlaying()==false) {
      steps.play();
    }
  }
  if (key == 'd') {
    w1.isMovingRight = true;
    if (steps.isPlaying()==false) {
      steps.play();
    }
  }
  if (key == 'w' && w1.isJumping == false && w1.isFalling == false) {
    w1.isJumping = true;
    w1.isFalling = false;
    w1.heighestY = w1.y - w1.jumpHeight;
    button.play();
  }

  if (key == ' ' && state == 1) {
    state = 8;
  } else if (key == ' ' && state == 8) {
    state = 2;
  } else if (key == ' ' && (state == 3 || state == 4)) {
    isPickingUp = true;
      //      if (w1.isFacingRight == true) {
      //    pickupRAnimation.isAnimating = true;
      //    pickupRAnimation.display(int(w1.x-xOffset), w1.y);
      //  if(pickupRAnimation.isFinished == true){
      //    isPickingUp = false;
      //  }
      //} else if (w1.isFacingLeft == true) {
      //    pickupLAnimation.isAnimating = true;
      //    pickupLAnimation.display(int(w1.x-xOffset), w1.y);
      //    if(pickupLAnimation.isFinished == true){
      //      isPickingUp = false;
      //    }
      //  }
        
  }
}


void keyReleased() {
  /////////////////////////////////////
  // Witch Moving
  if (key == 'a') {
    w1.isMovingLeft = false;
    steps.stop();
  }
  if (key == 'd') {
    w1.isMovingRight = false;
    steps.stop();
  }
  if (key == ' ') {
    isPickingUp = false;
  }
}

void mousePressed() {
  if ( state != 1 && w1.isFacingRight == true) {
    fireList.add(new Fire(w1.x + 70, w1.y));
    w1.isAttacking = true;
  }

  if ( state != 1 && w1.isFacingLeft == true) {
    fireList.add(new Fire(w1.x -70, w1.y));
    w1.isAttacking = true;
  }
}
