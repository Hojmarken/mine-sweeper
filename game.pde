int gridWidth = 12;
int gridHeight = 12;
boolean gameOver = false;
boolean gameWon = false;
int numberOfFlags = 0;
int shownTiles = 0;
int timePassed;

void gameOver() {
  gameOver=true;
  showIncorrectFlags();
  showBombs();
  drawSmiley();
}

void checkIfWon() {
  if (numberOfFlags==mines&&shownTiles==gridWidth*gridHeight-mines) {
    gameWon=true;
    drawSmiley();
  }
}

void restartGame() {
  gameOver = false;
  gameWon = false;
  numberOfFlags = 0;
  shownTiles = 0;
  timePassed = 0;
  firstClick = true;
  grid = new int[gridHeight][gridWidth][2];
  drawAllTiles();
  showMinesCounter();
  drawSmiley();
  timeCounter.draw("000");
}
