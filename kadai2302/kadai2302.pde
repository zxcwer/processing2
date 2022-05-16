PImage img1;
int sw = 1;
int mosaicN = 0;

void setup(){
  size(480, 420);
  img1 = loadImage("picture001.png");
}

void draw(){
  img1.loadPixels();
  image(img1,0,0);
  if(mousePressed && mouseButton == RIGHT){
    sw = 1;
  }

  if (sw==1){
    img1 = loadImage("picture001.png");
  }
  else if(sw == 0){
	background(255,255,255);
  }else if((sw!=1)&&(sw!=0) ){
	  for(int y = 0; y<img1.height; y+=mosaicN ){
		for(int x = 0; x<img1.width; x+=mosaicN){
			color c = img1.pixels[y*(img1.width)+x];
			fill(c);
			rect(x,y,mosaicN,mosaicN);
		}
	}
  }
  

}

void keyPressed(){
  if(key=='2'){
	mosaicN = 2;
	sw = 2;
  }else if(key=='3'){
	mosaicN = 3;
	sw = 3;
  }else if(key=='4'){
	mosaicN = 4;
	sw = 4;
  }else if(key=='5'){
	mosaicN = 5;
	sw = 5;
  }else if(key=='6'){
	mosaicN = 6;
	sw = 6;
  }else if(key=='7'){
	mosaicN = 7;
	sw = 7;
  }else if(key=='8'){
	mosaicN = 8;
	sw = 8;
  }else if(key=='9'){
	mosaicN = 9;
	sw = 9;
  }else if(key=='0'){
	mosaicN = 10;
	sw = 10;
  }else if(key=='c'){
	mosaicN = 0;
	sw = 0;
  }
}

void mosaicProcessing(int n){
	for(int y = 0; y<img1.height; y+=n ){
		for(int x = 0; x<img1.width; x+=n){
			color c = img1.pixels[y*img1.width+x];
			fill(c);
			rect(x,y,n,n);
		}
	}
}
