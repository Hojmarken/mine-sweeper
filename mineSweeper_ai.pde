void settings() {
  size(tileSize*(gridWidth+2), tileSize*(gridHeight+4));
}

void setup() {
  background(200);
  loadImages();
  timeCounter = new Counter(width-3.5*tileSize-13, 1.5*tileSize);
  drawAllTiles();
  showMinesCounter();
  drawSmiley();
  timeCounter.draw("000");
}

void draw() {
}

//Losing screen
//Wining screen
//Timer
