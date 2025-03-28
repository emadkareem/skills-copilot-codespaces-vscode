class Character {
  //fields
  PVector pos, vel, dim;
  float damp = 0.8; //constant damping factor
  boolean jumping = false;
  Block block = null;
  PImage img; 
  
  //a constructor to initialize the fields above with initial values
  Character(PVector pos, PImage img) {
    this.pos = pos;
    vel = new PVector(); //must create instance
    dim = new PVector(32, 48);
    this.img = img;
  }
  //move method, PVector force as parameter, add to acceleration
  void move(PVector acc) {
    vel.add(acc);
  }
  
  //update the physics for the character
  void update() {
    vel.mult(damp); //multiply velocity by dampening factor (0.9-0.99);
    pos.add(vel); //add velocity to position (moves character)
   
  }
  
  void jump(PVector upAcc) {
      move(upAcc);
      jumping = true;
  }

  void landOn(Block b) {
    jumping = false;
    block = b;
     if (b instanceof Cheese) { //When it's an instance of Cheese
    jumping = true; //still needs to maintain jumping for further landing down 
    collectedCheese++;
    return;
  }
    pos.y = b.pos.y - dim.y /2 - b.dim.y / 2;
    vel.y = 0;
  }
  
  void fall() {
    vel.y *= -1;
  }
  
  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    //ellipse(0, 0, dim.x, dim.y);
    //image(img,0,0);
    if (vel.x>0) {
      scale(-1,1);
    }
    image(img, -img.width/2,-img.height/2);
    popMatrix();
  }
}
