class Forrest {
  Land[][] forest;
  int s;
  Forrest (int numRows, int numCols, int treeDensity) {
    forest= new Land[numRows][numCols];
    s=width/numCols;
    createForest(treeDensity);
  }//constructor
  void createForest (int treeDensity) {
    for (int r=0; r<forest.length; r++) {
      for (int c=0; c<forest[r].length; c++) {
        if (c==0) {
          forest[r][c]=new Land(s*c, s*r+50, s, FIRE);
        } else {
          float v=random(100);
          if (v<=treeDensity) {
            forest[r][c]=new Land(s*c, s*r+50, s, TREE);
          } else {
            forest[r][c]=new Land(s*c, s*r+50, s, DIRT);
          }
        }
      }
    }
  }// instantiate forest with Lands
  void displayAll () {
    for (int r=0; r<forest.length; r++) {
      for (int c=0; c<forest[r].length; c++) {
        forest[r][c].display();
      }
    }
  }// display() all Lands in forest
  void spread1() {
    for (int r=0; r<forest.length; r++) {
      for (int c=0; c<forest[r].length; c++) {
        int neighborState=FIRE;
        if (c>0) {
          neighborState=forest[r][c-1].state;
        }
        forest[r][c].updateNextState(neighborState);
      }
    }
    for (int r=0; r<forest.length; r++) {
      for (int c=0; c<forest[r].length; c++) {
        forest[r][c].changeState();
      }
    }
  }// spread 1
  void spread4() {
    for (int r=0; r<forest.length; r++) {
      for (int c=0; c<forest[r].length; c++) {
        int neighborState=DIRT;
        boolean fire=false;
        if (c>0) {
          if (forest[r][c-1].state==FIRE) {
            fire=true;
          }
        }
        if (c<(forest[r].length-1)&&!fire) {
          if (forest[r][c+1].state==FIRE) {
            fire=true;
          }
        }
        if (r>0&&!fire) {
          if (forest[r-1][c].state==FIRE) {
            fire=true;
          }
        }
        if (r<(forest.length-1)&&!fire) {
          if (forest[r+1][c].state==FIRE) {
            fire=true;
          }
        }
        if (fire) {
          neighborState=FIRE;
        }
        forest[r][c].updateNextState(neighborState);
      }
    }
    for (int r=0; r<forest.length; r++) {
      for (int c=0; c<forest[r].length; c++) {
        forest[r][c].changeState();
      }
    }
  }// spread 4
  void spread8() {
    for (int r=0; r<forest.length; r++) {
      for (int c=0; c<forest[r].length; c++) {
        int neighborState=DIRT;
        boolean fire=false;
        if (c>0) {
          if (forest[r][c-1].state==FIRE) {
            fire=true;
          }
        }
        if (c<(forest[r].length-1)&&!fire) {
          if (forest[r][c+1].state==FIRE) {
            fire=true;
          }
        }
        if (r>0&&!fire) {
          if (forest[r-1][c].state==FIRE) {
            fire=true;
          }
        }
        if (r<(forest.length-1)&&!fire) {
          if (forest[r+1][c].state==FIRE) {
            fire=true;
          }
        }
        if (c>0&&r>0&&!fire) {
          if (forest[r-1][c-1].state==FIRE) {
            fire=true;
          }
        }
        if (c<(forest[r].length-1)&&r>0&&!fire) {
          if (forest[r-1][c+1].state==FIRE) {
            fire=true;
          }
        }
        if (r<(forest.length-1)&&c<(forest[r].length-1)&&!fire) {
          if (forest[r+1][c+1].state==FIRE) {
            fire=true;
          }
        }
        if (r<(forest.length-1)&&c>0&&!fire) {
          if (forest[r+1][c-1].state==FIRE) {
            fire=true;
          }
        }
        if (fire) {
          neighborState=FIRE;
        }
        forest[r][c].updateNextState(neighborState);
      }
    }
    for (int r=0; r<forest.length; r++) {
      for (int c=0; c<forest[r].length; c++) {
        forest[r][c].changeState();
      }
    }
  }// spread 8
}//class Forrest
