float speed = 2;
PVector upForce = new PVector(0, -speed * 24);
PVector leftForce = new PVector(-speed, 0);
PVector rightForce = new PVector(speed, 0);
boolean up, left, right;
float grav = 2;
PVector gravForce = new PVector(0, grav);
GameWorld gw;
Character player;

int totalCheese;  
int collectedCheese = 0;  
int timer = 30;  
boolean gameOver = false; 

//ArrayList<Block> blocks = new ArrayList<Block>();

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) up = true;
    else if (keyCode == LEFT) left = true;
    else if (keyCode == RIGHT) right = true;
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) up = false;
    else if (keyCode == LEFT) left = false;
    else if (keyCode == RIGHT) right = false;
  }
}
void setup() {
  size(800, 600); 
  frameRate(60);
  gw = new GameWorld();
  stroke(200);
  strokeWeight(2);
  fill(63);
  //loading the image
  PImage characterImg = loadImage("./data/mouse.png");
  characterImg.resize(50,65);
  player = new Character(new PVector(width/4, height/4),characterImg);
  player.jumping = true;
  
  totalCheese = 0;
  for (Block b : gw.blocks) {
    if (b instanceof Cheese){
      totalCheese++;
    }
  }
  //blocks.add(new Block(new PVector(width/2, height - 20), new PVector(width, 40)));
  //blocks.add(new Block(new PVector(200, height - 120), new PVector(200, 40)));
  //blocks.add(new Block(new PVector(400, height - 240), new PVector(200, 40)));
  //blocks.add(new Block(new PVector(700, height - 360), new PVector(200, 40)));


}
void draw() {
  if (gameOver) {
    background(135,206,235);
    textSize (32);
    fill(0);
    
    if(collectedCheese == totalCheese) {
      text("MOUSEY WINS", width/2-100,height/2);
    } else {
      text("YOU LOSE MOUSEYY!", width/2 -100, height/2);
    }
      return;
  }
    if (timer <= 0 || collectedCheese == totalCheese) {
    gameOver = true;
  }

  background(255);  
  gw.drawMe();
  if (up && !player.jumping) {
    player.jump(upForce);
  }
  if (left) player.move(leftForce);
  if (right) player.move(rightForce);

  player.update();

  if (player.block != null) {
    if (!player.block.isOn(player)) {
      player.jumping = true;
    }
  }
  if (player.jumping) {
    player.move(gravForce);
    for (int i = 0; i < gw.blocks.size(); i++) {
      Block b = gw.blocks.get(i);
      if (b.check(player)) {
        if (player.vel.y > 0) {
          player.landOn(b);
        }
        else {
          player.fall();
        }
      }
    }
  }
 
  displayHUD();
  player.drawMe();
}
void displayHUD() {
  fill(0);  
  textSize(16);
  text("Time: " + timer, 10, 30);
  text("Cheese: " + collectedCheese + "/" + totalCheese, 10, 50);

  //The countdownn
  if (frameCount % 60 == 0 && timer > 0) {  
    timer--;
  }

  if (timer <= 0) {
    gameOver = true;
  }

  // checking the collected cheesw
  if (collectedCheese == totalCheese) {
    gameOver = true;
    
    textSize(32);
    fill(0, 80, 40);  
    text("MOUSEY WINS!", width / 2 - 100, height / 2);
  }
}
