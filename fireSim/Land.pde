class Land {

  //display related fields
  int size;
  PVector corner;

  //current state and next state
  int state;
  int nextState;


  Land(int _x, int _y, int sz, int st) {
    corner = new PVector(_x, _y);
    size = sz;
    state = st;
  }

  void display() {
    //set fill color based on state
    if (state == DIRT) {
      fill(DIRT_COLOR);
    }
    else if (state == FIRE) {
      fill(FIRE_COLOR);
    }
    else if (state == BURNT) {
      fill(BURNT_COLOR);
    }
    else if (state == TREE) {
      fill(TREE_COLOR);
    }
    square(corner.x, corner.y, size);
  }

  //set nextState based on current state and possibly neighborState
  void updateNextState(int neighborState) {
    if (state == FIRE) {
      nextState = BURNT;
    }
    else if (state == TREE && neighborState  == FIRE) {
      nextState = FIRE;
    }
    else {
      nextState = state;
    }
  }//updateState

  void changeState() {
    state = nextState;
  }//changeState

}//Land class
