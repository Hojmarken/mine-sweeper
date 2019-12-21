PImage[] tileImgs = new PImage[13];
PImage[] smileyImgs = new PImage[3];
PImage[] counterImgs = new PImage[10];
int tileSize = 16;
int fieldXOffset = 1*tileSize;
int fieldYOffset = 3*tileSize;
Counter minesCounter = new Counter(tileSize*3.5-13, 1.5*tileSize);
Counter timeCounter;


void loadImages() {
  tileImgs[0]=loadImage("tiles/tileblank.png");
  tileImgs[1]=loadImage("tiles/tile1.png");
  tileImgs[2]=loadImage("tiles/tile2.png");
  tileImgs[3]=loadImage("tiles/tile3.png");
  tileImgs[4]=loadImage("tiles/tile4.png");
  tileImgs[5]=loadImage("tiles/tile5.png");
  tileImgs[6]=loadImage("tiles/tile6.png");
  tileImgs[7]=loadImage("tiles/tile7.png");
  tileImgs[8]=loadImage("tiles/bomb.png");
  tileImgs[9]=loadImage("tiles/tileunpressed.png");
  tileImgs[10]=loadImage("tiles/tilebombclicked.png");
  tileImgs[11]=loadImage("tiles/tilebombx.png");
  tileImgs[12]=loadImage("tiles/flag.png");
  smileyImgs[0]=loadImage("tiles/happysmiley.png");
  smileyImgs[1]=loadImage("tiles/deadsmiley.png");
  smileyImgs[2]=loadImage("tiles/coolsmiley.png");
  //smileyImgs[1]=loadImage("tiles/pressedsmiley.png"); could potentially be added
  //when the smiley is pressed or one is in the midst of checking a tile
  counterImgs[0]=loadImage("tiles/num0.png");
  counterImgs[1]=loadImage("tiles/num1.png");
  counterImgs[2]=loadImage("tiles/num2.png");
  counterImgs[3]=loadImage("tiles/num3.png");
  counterImgs[4]=loadImage("tiles/num4.png");
  counterImgs[5]=loadImage("tiles/num5.png");
  counterImgs[6]=loadImage("tiles/num6.png");
  counterImgs[7]=loadImage("tiles/num7.png");
  counterImgs[8]=loadImage("tiles/num8.png");
  counterImgs[9]=loadImage("tiles/num9.png");
}

void showMinesCounter() {
  minesCounter.draw(""+(mines-numberOfFlags));
}

void drawAllTiles() {
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      drawTile(j, i);
    }
  }
}

void drawTile(int j, int i) {
  int x = j*tileSize+fieldXOffset;
  int y = i*tileSize+fieldYOffset;
  if (grid[i][j][1]==1) {
    switch (grid[i][j][0]) {
    case -1:
      image(tileImgs[8], x, y);
      break;
    case 0:
      image(tileImgs[0], x, y);
      break;
    case 1:
      image(tileImgs[1], x, y);
      break;
    case 2:
      image(tileImgs[2], x, y);
      break;
    case 3:
      image(tileImgs[3], x, y);
      break;
    case 4:
      image(tileImgs[4], x, y);
      break;
    case 5:
      image(tileImgs[5], x, y);
      break;
    case 6:
      image(tileImgs[6], x, y);
      break;
    case 7:
      image(tileImgs[7], x, y);
      break;
    case 10:
      image(tileImgs[10], x, y);
      break;
    case 11:
      image(tileImgs[11], x, y);
      break;
    }
  } else if (grid[i][j][1]==0) {
    image(tileImgs[9], x, y);
  } else if (grid[i][j][1]==2) {
    image(tileImgs[12], x, y);
  }
}

void showBombs() {
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      if ((grid[i][j][0]==-1&&grid[i][j][1]!=2)||grid[i][j][0]==10||grid[i][j][0]==11) {
        grid[i][j][1]=1;
        drawTile(j, i);
      }
    }
  }
}

void showIncorrectFlags() {
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      if (grid[i][j][1]==2&&grid[i][j][0]!=-1) {
        grid[i][j][0]=11;
      }
    }
  }
}

void drawSmiley() {
  imageMode(CENTER);
  if (gameOver==true) {
    image(smileyImgs[1], width/2, 1.5*tileSize);
  } else if (gameWon) {
    image(smileyImgs[2], width/2, 1.5*tileSize);
  } else {
    image(smileyImgs[0], width/2, 1.5*tileSize);
  }
  imageMode(CORNER);
}
