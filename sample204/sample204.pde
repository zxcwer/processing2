PImage img1,img2;
int w,h;

void setup(){
  size(480,420);
  img1 = loadImage("image001.png");
  img2 = loadImage("image001.png");  
}

void draw(){
  image(img1,0,0,img1.width*0.5,img1.height*0.5);
  image(img2,img1.width*0.5,img1.height*0.5,img1.width*0.5,img1.height*0.5);
}

void mousePressed(){
  img2.loadPixels();
  int n = img2.width*img2.height;
  for(int i = 0; i<n; i++){
    float r = red(img2.pixels[i]);
    float g = green(img2.pixels[i]);
    float b = blue(img2.pixels[i]);
    float lv = (r+g+b)/3;
    if(lv < 0.0){
      lv = 0.0;
    }else if(lv > 250){
      lv = 255.0;
    }
    img2.pixels[i] = color(lv,lv,lv);
  }
  
  img2.updatePixels();
}
