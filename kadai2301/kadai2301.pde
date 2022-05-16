PImage img1;
int sw = 1;

void setup(){
  size(480,420);
  img1 = loadImage("picture001.png");
}

void draw(){
  image(img1,0,0);
  if(mousePressed && mouseButton == RIGHT){
    sw = 1;
  }
  if (sw==1){
    img1 = loadImage("picture001.png");
  }else if(sw == 0){
    background(255,255,255);
  }
}
void keyPressed(){
  if(key =='a'){
    sw = 2;
    edgeDectection();
  }else if (key=='c'){
    sw = 0;
  }
}
void edgeDectection(){
  img1.loadPixels();

  //原画像をグレースケール画像に変換する
  //グレースケール画素の行列
  color[][] greys = new color[img1.width][img1.height];
  for(int x = 0; x < img1.width; x++){
    for(int y = 0; y < img1.height; y++){
      color c = img1.pixels[y * img1.width + x];
      //カラー画像(RGB)をグレースケール画像に変換するための公式: gray = Red*0.3 + Green*0.59 + Blue*0.11
      float grey = 0.30 * red(c) + 0.59 * green(c) + 0.11 * blue(c);
      greys[x][y] = color(grey, grey, grey); 
    }
  }
  //ソーベルフィルターでエッジ検出を求める
  for(int x = 0; x < img1.width ; x ++){
    for(int y = 0; y < img1.height; y ++){
      //垂直方向　-1 -2 -1        水平方向  -1  0  1
      //         0  0  0                 -2  0  2
      //         1  2  1                 -1  0  1
      if(x == 0 || x == img1.width - 1 || y == 0 || y == img1.height - 1){
        img1.pixels[y * img1.width + x] = color(0);
      } else {
        float fx = - red(greys[x - 1][y - 1]) + 
                   - 2 * red(greys[x - 1][y]) +
                   - red(greys[x - 1][y + 1]) +
                   red(greys[x + 1][y - 1]) +
                   2 * red(greys[x + 1][y]) +
                   red(greys[x + 1][y + 1]);      
        float fy = - red(greys[x - 1][y - 1]) + 
                   - 2 * red(greys[x][y - 1]) +
                   - red(greys[x + 1][y - 1]) +
                   red(greys[x - 1][y + 1]) +
                   2 * red(greys[x][y + 1]) +
                   red(greys[x + 1][y + 1]);
        //公式: = (fx^2+fy^2)^(0.5)
         float grey = sqrt(sq(fx) + sq(fy));
         img1.pixels[y * img1.width + x] = color(grey, grey, grey);      
       }

    }
  }
  img1.updatePixels();
}
