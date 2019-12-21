class Counter {
  float x;
  float y;
  Counter(float x_, float y_) {
    x=x_;
    y=y_;
  }
  void draw(String numbers) {
    while (numbers.length()<3) {
      numbers="0"+numbers;
    }
    for (int i=0; i<numbers.length(); i++) {
      drawNumber(x+i*13,y,(int)numbers.charAt(i)-(int)'0');
    }
  }

  void drawNumber(float x1, float y1, int num) {
    imageMode(CENTER);
    switch(num) {
    case 0:
      image(counterImgs[0], x1, y1);
      break;
    case 1:
      image(counterImgs[1], x1, y1);
      break;
    case 2:
      image(counterImgs[2], x1, y1);
      break;
    case 3:
      image(counterImgs[3], x1, y1);
      break;
    case 4:
      image(counterImgs[4], x1, y1);
      break;
    case 5:
      image(counterImgs[5], x1, y1);
      break;
    case 6:
      image(counterImgs[6], x1, y1);
      break;
    case 7:
      image(counterImgs[7], x1, y1);
      break;
    case 8:
      image(counterImgs[8], x1, y1);
      break;
    case 9:
      image(counterImgs[9], x1, y1);
      break;
    }
    imageMode(CORNER);
  }
}
