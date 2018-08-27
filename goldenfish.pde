import org.gicentre.handy.*;

HandyRenderer h;
PolkaDot pd = new PolkaDot();
Fish []fish = new Fish[4]; 

void setup() {
  size(360, 640);

  h = new HandyRenderer(this);

  pd.setup();

  for (int i = 0; i<fish.length; i++) {
    fish[i] = new Fish(random(30, width-30), 100+150*(i), HALF_PI);
    fish[i].setTailRotate(random(radians(-20), radians(20)));
  }

  smooth();
}

void draw() {
  //
  //pd.monochrome();

  //set color
  color c = color(0);
  pd.colorful(c);


  for (int i = 0; i < fish.length; i++)  fish[i].draw();

  save("fish5.png");
  noLoop();
}