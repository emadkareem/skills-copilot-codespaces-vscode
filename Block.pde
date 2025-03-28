class Block {
    PVector pos, dim;
    Block(PVector pos, PVector dim) {
        this.pos = pos;
        this.dim = dim;
    }
    boolean isOn(Character c) {
        if (abs(c.pos.x - pos.x) < c.dim.x / 2 + dim.x / 2) {
            return true;
        }
        return false;
    }
    boolean check(Character c) {
        if (abs(c.pos.x - (pos.x-c.pos.x)) < c.dim.x / 2 + dim.x / 2 &&
            abs(c.pos.y - pos.y) < c.dim.y / 2 + dim.y / 2) {
            return true;
        }
        return false;
    }
    void drawMe() {
        pushMatrix();
        translate(pos.x, pos.y);
        rect(-dim.x/2, -dim.y/2, dim.x, dim.y);
        popMatrix();
    }
    //overloading, with diff input parameters
     void drawMe(Character c) {
   stroke(210, 160, 210); 
   fill(200, 150, 200); //pink
   pushMatrix();
   translate(-c.pos.x + pos.x, pos.y);
   rect(-dim.x/2, -dim.y/2, dim.x, dim.y);
   popMatrix();
 }
    
}
