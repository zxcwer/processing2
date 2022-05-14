PImage image;

void setup(){
  size(512, 512);
  noStroke();
  image = loadImage("image001.png");
  image(image, 0, 0);
  loadPixels();
  color[][] greys = new color[width][height];
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      color c = pixels[y * width + x];
      float grey = 0.30 * red(c) + 0.59 * green(c) + 0.11 * blue(c);
      greys[x][y] = color(grey, grey, grey);
    }
  }
  for(int x = 0; x < width ; x += 1){
    for(int y = 0; y < height; y += 1){
      if(x == 0 || x == width - 1 || y == 0 || y == height - 1){
        pixels[y * width + x] = color(0);
      } else {
        float vg = - red(greys[x - 1][y - 1]) + 
                   - 2 * red(greys[x - 1][y]) +
                   - red(greys[x - 1][y + 1]) +
                   red(greys[x + 1][y - 1]) +
                   2 * red(greys[x + 1][y]) +
                   red(greys[x + 1][y + 1]);      
        float hg = - red(greys[x - 1][y - 1]) + 
                   - 2 * red(greys[x][y - 1]) +
                   - red(greys[x + 1][y - 1]) +
                   red(greys[x - 1][y + 1]) +
                   2 * red(greys[x][y + 1]) +
                   red(greys[x + 1][y + 1]);
         float grey = sqrt(sq(vg) + sq(hg));
         pixels[y * width + x] = color(grey, grey, grey);      
       }

    }
  }
  updatePixels();
}
