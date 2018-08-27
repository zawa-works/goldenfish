import org.gicentre.handy.*;

HandyRenderer h;
Fish fish; 

void setup() {
  size(500, 500);
  background(-1);

  h = new HandyRenderer(this);
  fish = new Fish(random(0, width), random(0, height));
  smooth();
  //frameRate(20);
}

void draw() {

  background(-1);

  //fish[i].setPosition(i, mouseY);
  fish.draw();
}