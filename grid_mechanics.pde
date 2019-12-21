int[][][] grid = new int[gridHeight][gridWidth][2];
int mines = floor(gridHeight*gridWidth*0.2);
int safeZoneSize = 1;

void createPlayingField(int j, int i) {
  insertMines(j, i);
  asignValuesToTiles();
}

void insertMines(int j, int i) {
  int count = mines;
  while (count!=0) {
    int x = floor(random(gridWidth));
    int y = floor(random(gridHeight));
    if ((safeZoneSize+j<x||x<j-safeZoneSize||safeZoneSize+i<y||y<i-safeZoneSize)&&grid[y][x][0]==0) {
      grid[y][x][0]=-1;
      count--;
    }
  }
}

void asignValuesToTiles() {
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      if (grid[i][j][0]!=-1) {
        grid[i][j][0]=countNeightbouringBombs(j, i);
      }
    }
  }
}

int countNeightbouringBombs(int x, int y) {
  int count = 0;
  for (int i=-1; i<=1; i++) {
    for (int j=-1; j<=1; j++) {
      if (i==0&&j==0) {
        continue;
      }
      if (x+j>=0&&x+j<gridWidth&&y+i>=0&&y+i<gridHeight) {
        if (grid[y+i][x+j][0]==-1) {
          count++;
        }
      }
    }
  }
  return count;
}
