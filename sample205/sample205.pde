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

  int fsize = 3;
  int sz = fsize/2;
  for(int y = sz; y<img2.height-sz; y++){
    for(int x = sz; x<img2.width-sz; x++){
      float r = 0.0;
      float g = 0.0;
      float b = 0.0;
      
      for(int j = -sz; j<=sz; j++){
        for(int i = -sz; i<=sz; i++){
          r += red(img2.get(x+i,y+j));
          g += green(img2.get(x+i,y+j));
          b += blue(img2.get(x+i,y+j));
        }
      }
      float rr = r/(fsize*fsize);
      float gg = g/(fsize*fsize);
      float bb = b/(fsize*fsize);
      
      color c = color(rr,gg,bb);
      img2.set(x,y,c);
    }
  }
}
