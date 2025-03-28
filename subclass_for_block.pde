class Cheese extends Block {
  PImage img;

  Cheese(PVector pos, PVector dim) {
    super(pos, dim);
    img = loadImage("cheese1.png");
    img.resize((int) dim.x, (int) dim.y);
  }
   boolean check(Character c) {
        if (abs(c.pos.x - (pos.x-c.pos.x)) < c.dim.x / 2 + dim.x / 2 &&
            abs(c.pos.y - pos.y) < c.dim.y / 2 + dim.y / 2) {
              gw.blocks.remove(this);
              collectedCheese++;
            return true;
        }
        return false;
    }
  void drawMe(Character c) {
    pushMatrix();
    translate(pos.x -c.pos.x, pos.y);
    image(img, -dim.x/2, -dim.y/2);
    popMatrix();
  }
}
