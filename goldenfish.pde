import org.gicentre.handy.*;

PImage img;
HandyRenderer h;
Fish fish; 

void setup() {
  size(100, 100);
  background(0);

  h = new HandyRenderer(this);
  fish = new Fish(width/2, height/2);
  smooth();
}

void draw() {
  img = createImage(width, height, ARGB);
  background(0);

  fish.draw();

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      color c = get(x, y);

      if (c < #000010)continue;
      img.set(x, y, c);
    }
  }

  img.save("fish/fish_"+nf(frameCount, 3)+".png");

  if (frameCount < 160)return;
  noLoop();

  println("save");
}