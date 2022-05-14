PImage img1,img2;
int sw = 0;

void setup(){
  size(480,420);
  img1 = loadImage("image001.png");
  img2 = loadImage("image001.png");
}
void draw(){
  background(255,255,255);
  image(img1,0,0,img1.width,img1.height);
  if (mousePressed && (mouseButton == RIGHT)){
    sw = 1;
  }
  if (sw == 1){
    background(255,255,255);
    image(img1,0,0,img1.width/2,img1.height/2);
    img2.filter(GRAY);
    image(img2,img2.width/2,0,img2.width/2,img2.height/2);
  }else if (sw == 2){
    background(255,255,255);
    image(img1,0,0,img1.width/2,img1.height/2);
    img2.filter(THRESHOLD,0.5);
    image(img2,img2.width/2,0,img2.width/2,img2.height/2);
  }else if (sw == 3){
    background(255,255,255);
    image(img1,0,0,img1.width/2,img1.height/2);
    img2.filter(GRAY);
    image(img2,img2.width/2,0,img2.width/2,img2.height/2);
  }
  else if (sw == 0){
    img2 = loadImage("image001.png");
  }
  fill(0,0,0);
  text("mouseButton:RIGHT ==>> full color and grey picture, key:c ==> [Clean up]",0,380);
  text("key:b ==> [binaryImage], key:g ==> [Grey]",0,390);
  

}

void keyPressed(){
  if (key == 'b'){
    sw = 2;
  }else if(key == 'g'){
    sw = 3;
  }else if(key == 'c'){
    sw = 0;
    background(255,255,255);
    
  }
}
