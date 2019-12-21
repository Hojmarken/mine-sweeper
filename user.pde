ArrayList<Vector> traversedTiles = new ArrayList<Vector>();
boolean firstClick = true;

int[] getTileUnderMouse() {
  int[] result = {floor((mouseX-fieldXOffset)/16), floor((mouseY-fieldYOffset)/16)};
  return result;
}

void mousePressed() {
  if (mouseY>=fieldYOffset&&mouseY<fieldYOffset+gridHeight*tileSize&&mouseX>=fieldXOffset&&mouseX<fieldXOffset+gridWidth*tileSize) {
    if (!gameOver&&!gameWon) {
      int[] mTile = getTileUnderMouse();
      if (mouseButton == LEFT) {
        if (firstClick==true) {
          createPlayingField(mTile[0], mTile[1]);
          firstClick = false;
        }
        pressTile(mTile[0], mTile[1]);
      } else if (mouseButton == RIGHT) {
        flagTile(mTile[0], mTile[1]);
      }
      if (!gameOver) {
        checkIfWon();
      }
    }
  } else {
    if (mouseX>=width/2-13&&mouseX<width/2+13&&mouseY>=1.5*tileSize-13&&mouseY<1.5*tileSize+13) {
      restartGame();
    }
  }
}

void flagTile(int j, int i) {
  if (grid[i][j][1]==0) {
    grid[i][j][1]=2;
    numberOfFlags++;
    showMinesCounter();
    drawTile(j, i);
  } else if (grid[i][j][1]==2) {
    grid[i][j][1]=0;
    numberOfFlags--;
    showMinesCounter();
    drawTile(j, i);
  }
}

void pressTile(int j, int i) {
  if (grid[i][j][1]==0) {
    if (grid[i][j][0]==-1) {
      grid[i][j][0]=10;
      gameOver();
    } else if (grid[i][j][0]==0) {
      traversedTiles = new ArrayList<Vector>();
      floodReveal(j, i);
    } else {
      grid[i][j][1]=1;
      shownTiles++;
      drawTile(j, i);
      
    }
  }
}

void floodReveal(int j, int i) {
  traversedTiles.add(new Vector(j, i));
  for (int x=-1; x<=1; x++) {
    for (int y=-1; y<=1; y++) {
      if (x+j>=0&&x+j<gridWidth&&y+i>=0&&y+i<gridHeight) {
        if (grid[y+i][x+j][1]!=2) {
          if (grid[y+i][x+j][1]==0) {
            grid[y+i][x+j][1]=1;
            shownTiles++;
          }
          drawTile(x+j, y+i);
          if (grid[y+i][x+j][0]==0) {
            boolean isChecked = false;
            for (int g=0; g<traversedTiles.size(); g++) {
              if (traversedTiles.get(g).i==y+i&&traversedTiles.get(g).j==x+j) {
                isChecked = true;
                break;
              }
            }
            if (!isChecked) {
              floodReveal(x+j, y+i);
            }
          }
        }
      }
    }
  }
}
