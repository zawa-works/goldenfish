class Fish {
  float posX, posY, fishRotate;
  float tailRotate = -20;

  Fish(float x, float y, float rad) {
    posX = x;
    posY = y;
    fishRotate = rad;
  }


  void draw() {
    pushMatrix();
    translate(posX, posY);
    scale(0.1);

    rotate(fishRotate);

    leftFin();
    rightFin();

    body(50, 0);
    tail(-50, 0);

    head();

    popMatrix();
  }

  void setTailRotate(float rad) {
    if (rad > radians(20))rad = radians(20);
    if (rad < radians(-20))rad = radians(-20);
    tailRotate = rad;
  }

  void body(float posX, float posY) {
    pushMatrix();
    translate(posX, posY);
    rectMode(CORNERS);

    noStroke();
    fill(#FF6E00);

    for (int i = 0; i <= 180; i+=5) {
      float rad = radians(i);
      h.rect(
        100*cos(rad), 70*sin(rad), 
        100*cos(-rad) + 20, 70*sin(-rad)
        );
    }

    popMatrix();
  }

  void head() {

    rectMode(CORNER);

    stroke(255, 200);
    fill(#FF6E00);

    for (int i = -5; i <= 5; i++) {
      float sizeX = map(abs(i), 0, 10, -200, -20);
      h.rect(-sizeX/2, i*2, sizeX, 2);
    }
  };

  void leftFin() {

    pushMatrix();
    rectMode(CORNER);

    translate(80, 0);
    noStroke();
    fill(#FF6E00, 100);

    for (int i = 45; i < 90; i += 5) {
      float rad = -radians(i);
      float x = 100*cos(rad)-50;
      float y = 50*sin(rad)-50*sin(PI/4);
      h.rect(x, y, -100 - (i - 45), -10);
    }

    popMatrix();
  }

  void rightFin() {
    pushMatrix();
    rectMode(CORNER);

    translate(80, 70);

    noStroke();
    fill(#FF6E00, 100);

    for (int i = 45; i < 90; i += 5) {
      float rad = radians(i);
      float x = 100*cos(rad)-50;
      float y = 50*sin(rad)-50*sin(PI/4);
      h.rect(x, y, -100 - (i - 45), 10);
    }

    popMatrix();
  }

  void tail(float posX, float posY) {
    pushMatrix();
    rectMode(CORNER);

    translate(posX, posY);
    rotate(radians(tailRotate));

    noStroke();
    fill(#FF6E00, 150);

    for (int i = -90; i < 90; i += 5) {
      float rad = radians(i);
      float x = 100*cos(rad) - 100;
      float y = 50*sin(rad);
      h.rect(x, y, -100, 10);
    }

    popMatrix();
  }
}