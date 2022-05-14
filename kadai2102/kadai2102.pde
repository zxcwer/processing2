PImage img1,img2;

void setup(){
  size(480,360);
  img1 = loadImage("image001.png");
  img2 = loadImage("image001.png");
}
void draw(){
  background(255,255,255);
  image(img1,0,0,img1.width/2,img1.height/2);
  img2.filter(GRAY);
  image(img2,img2.width/2,0,img2.width/2,img2.height/2);
}
