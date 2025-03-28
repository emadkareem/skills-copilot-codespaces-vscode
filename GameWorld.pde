class GameWorld {

  //Constants to represent numbers for different types of block
  static final int TILE_EMPTY = 0;  //empty space
  static final int TILE_SOLID = 1;  //solid block
  static final int TILE_CHEESE = 2; //cheese block

  //Constants holding the sizes for different types of block
  static final int TILE_SIZE = 45;
  static final int CHEESE_SIZE = 15;

  ArrayList<Block> blocks = new ArrayList<Block>();

  // 0- empty, 1-solid block, 2-cheese
  int[][] map =
    { //i = 0 j=0 -> 0
    // i=3 j=5 -> 0

    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 2, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0},
    {2, 2, 2, 2, 2, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0},
    {1, 1, 1, 1, 0, 0, 0, 2, 1, 1, 1, 2, 0, 0, 0, 2, 1, 2, 0, 0, 0, 0, 0, 2, 2, 2, 2, 0},
    {0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 2, 2, 0, 2, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 2, 1, 1, 1, 1, 1, 2, 0, 2, 0, 0, 0, 2, 2, 2},
    {0, 2, 0, 0, 0, 0, 2, 0, 0, 2, 2, 0, 0, 1, 2, 2, 0, 0, 0, 0, 0, 1, 0, 0, 2, 2, 2, 2},
    {2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 0, 2, 2, 0, 2, 2, 2, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 0},
    {1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0}
  };

  GameWorld() {

    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < map[i].length; j++) {
        switch(map[i][j]) {
        case TILE_SOLID:
          blocks.add(new Block(new PVector(j*TILE_SIZE, i*TILE_SIZE), new PVector(TILE_SIZE, TILE_SIZE)));
          break;
        case TILE_CHEESE:
          blocks.add(new Cheese(new PVector(j*TILE_SIZE, i*TILE_SIZE), new PVector(CHEESE_SIZE, CHEESE_SIZE)));
          totalCheese++;
          break;
        default: //when it's empty space
          ; //do nothing
        }
      }
    }
    //Finally add a long block at the very bottom serving as the floor. Notice it's 3 times of the win width
    //The extra length is for side-scrolling in later on
    blocks.add(new Block(new PVector(3 * width/2, height - TILE_SIZE/2), new PVector(3 * width, TILE_SIZE)));
  }

  void drawMe() {
    for (int i = 0; i < blocks.size(); i++) {
      blocks.get(i).drawMe(player);
    }
  }
}
