class PolkaDot {
  PVector[] circleData = new PVector[200];
  color []circleColor = new color[200];
  boolean putable = false;
  PolkaDot() {
  }

  void setup() {
    for (int i = 0; i< circleData.length; i++) {

      putable = false;
      circleColor[i] = (int)random(#000000, #ffffff);

      while (!putable) {
        float r = random(2, 100);
        circleData[i] = new PVector(random(r, width-r), random(r, height-r), r);

        putable = true;

        for (int j = 0; j < i; j++) {
          putable = 
            (dist(circleData[i].x, circleData[i].y, circleData[j].x, circleData[j].y) 
            > circleData[i].z + circleData[j].z);
          if (!putable)break;
        }
      }
    }
  }

  void monochrome() {
    background(0);

    for (int i = 0; i < circleData.length; i++) 
      ellipse(circleData[i].x, circleData[i].y, circleData[i].z, circleData[i].z);
  }

  void colorful(color c) {
    background(c);
    float rectSize = 2;
    for (int j = 0; j < width; j += rectSize) {
      for (int i = 0; i < height; i += rectSize) {

        for (int k = 0; k < circleData.length; k++) {
          float distance = 
            dist(circleData[k].x, circleData[k].y, j+rectSize/2, i+rectSize/2);
          float alpha = map(distance, 0, circleData[k].z, 255, 0);
          stroke(circleColor[k], alpha);
          fill(circleColor[k], alpha);
          rect(j, i, rectSize, rectSize);
        }
      }
    }
  }
}