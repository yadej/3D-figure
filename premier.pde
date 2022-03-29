PGraphics pg;
PImage txtImg;
String s;
int n1 = 0;
int n2 = 1; 
int n3 = 0;
int n4 = 0;
int n5 = 1; 
int n6 = 0;

void setup()
{
  size(1000,1000, P3D);
  pg = createGraphics(300,300,P2D);
  textSize(32);
  frameRate(10);
  println("hello world");
  int a = 5;
  println(estPremier(a));
  //construitFigure();
  for(int i = 0; i <= 150; i++)
  {
    if(estPremier(i))
    {
      println(i);
    }
  }
  println(estParfait(496)); //renvoie vrai
  println(estParfait(13)); // renvoie faux
  //println(estAbondant(8)); // renvoie vrai
  //println(estAbondant(10)); // renvoie faux
  for(int i = 0; i <= 25; i++)
  {
    if(estAbondant(i))
    {
      println(i + ": est abondant");
    }
  }
}

void draw()
{    
    background(100,100,100);
    //affiche fonction
    drawF();
    //rotateX(frameCount/50.0);
    rotateX(PI/6);
    //rotateY(PI/6);
    //rotateZ(PI/6);
    translate(width/2,height/2, 90);
    if(estNeg(f1(1))){
          fill(0,0,0);
        }else if(estParfait(f1(1))){
          fill(0,255,0);
        }else if(estPremier(f1(1))){
          fill(255,255,0);
        }else if(estAbondant(f1(1))){
          fill(0,0,255);
        }else if(estDefaillant(f1(1))){
          fill(255,0,0);
        }
    myBox(20);
    textCube(1);
    int a = 1;
    int n = 2;
    int k = 0;
    int dir = 0;
    for(int i = 1; i<50; i++){
      if(i == 49)a--;
      for(int j = 0; j < a ;j++){
        if(dir == 0)translate(20,0);
        if(dir == 1)translate(0,-20);
        if(dir == 2)translate(-20,0);
        if(dir == 3)translate(0,20);
        if(k == 0 && a%2 ==1 && j == a-1)translate(0,0,-20);
        if(estNeg(f1(n))){
          fill(0,0,0);
        }else if(estParfait(f1(n))){
          fill(0,255,0);
        }else if(estPremier(f1(n))){
          fill(255,255,0);
        }else if(estAbondant(f1(n))){
          fill(0,0,255);
        }else if(estDefaillant(f1(n))){
          fill(255,0,0);
        }
        myBox(20);
        if(n < 100){
          textCube(n);
        }
        n++;
      }
      k++;
      if(k ==2){
        a++;
        k = 0;
      }
      if(dir == 3){
         dir = 0;
       }else{
          dir++;
       }
    }
   
 
}
PImage textImager(String s, PGraphics pg) {
  pg.beginDraw();
  pg.background(0,0,0,0);
  pg.textAlign(CENTER);
  pg.fill(0);
  pg.textSize(20);
  pg.text(s, 20, 20);
  pg.endDraw();
  return pg.get();
}
void textCube(int n){
  pushStyle();
         noFill();
         noStroke();
            // make an image with clock text
         s = "" + f1(n);
         txtImg = textImager(s, pg);
        // draw the image on a cube
        textureCube(txtImg);
     popStyle();
}

void drawF(){
  fill(0);
    text("f(x) = ", 10, 50);
    text(n1+"x²+"+n2+"x+"+n3, 110, 50);
    fill(0);
    
    text("f(x) = ", width-320+10, 50);
    text(n4+"x²+"+n5+"x+"+n6, width-320+110, 50);
    //affiche carrés
    fill(255);
    rect(120,5,20,20,5);
    rect(120,55,20,20,5);
    rect(200,5,20,20,5);
    rect(200,55,20,20,5);
    rect(250,5,20,20,5);
    rect(250,55,20,20,5);
    rect(width-200,5,20,20,5);
    rect(width-200,55,20,20,5);
    rect(width-120,5,20,20,5);
    rect(width-120,55,20,20,5);
    rect(width-60,5,20,20,5);
    rect(width-60,55,20,20,5);
}

void textureCube(PImage img) {
  // draw six faces
  textureFace(img, 0, 0, 0);
  //textureFace(img, 0,-HALF_PI, 0);
  //textureFace(img, 0, HALF_PI, 0);
  //textureFace(img, -HALF_PI, 0, 0);
  //textureFace(img,  HALF_PI, 0, 0);
}
void textureFace(PImage img, float rx, float ry, float rz){
  // rotate then draw a face
  pushMatrix();
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    beginShape();
      texture( img );
      vertex( 0, 0,  20, 0, 0);
      vertex( 20, 0,  20, 50, 0);
      vertex( 20,  20,  20, 50, 50);
      vertex(0,  20,  20, 0, 50);
      vertex(0, 0,  20, 0, 0);
    endShape();
  popMatrix();
}
void mouseClicked()
{
  if(mouseX >= 120 && mouseX < 120+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n1++;
  }
  if(mouseX >= 120 && mouseX < 120+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n1--;
  }
  if(mouseX >= 200 && mouseX < 200+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n2++;
  }
  if(mouseX >= 200 && mouseX < 200+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n2--;
  }
  if(mouseX >= 250 && mouseX < 250+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n3++;
  }
  if(mouseX >= 250 && mouseX < 250+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n3--;
  }
  if(mouseX >= width-200 && mouseX < width-200+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n4++;
  }
  if(mouseX >= width-200 && mouseX < width-200+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n4--;
  }
  if(mouseX >= width-120 && mouseX < width-120+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n5++;
  }
  if(mouseX >= width-120 && mouseX < width-120+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n5--;
  }
  if(mouseX >= width-60 && mouseX < width-60+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n6++;
  }
  if(mouseX >= width-60 && mouseX < width-60+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n6--;
  }
}
void myBox(float sideSize){
  float size = sideSize;
  beginShape();
  vertex(0, 0, 0);
  vertex(0,  size, 0);
  vertex(size,   size, 0);
  vertex(size,  0, 0);
  endShape(CLOSE);
  
  beginShape();
  vertex(0, 0, size);
  vertex(0,  size, size);
  vertex(size,   size, size);
  vertex(size,  0, size);
  endShape(CLOSE);
  
  beginShape();
  vertex(size, 0, 0);
  vertex(size, size, 0);
  vertex(size, size, size);
  vertex(size,   0, size);
  endShape();
  
  beginShape();
  vertex(0,  0, 0);
  vertex(0, 0, size);
  vertex(size, 0, size);
  vertex(size, 0, 0);
  endShape();
  
  beginShape();
  vertex(0,  size, 0);
  vertex(0,   size, size);
  vertex(size,  size, size);
  vertex(size, size, 0);
  endShape();
}

int sd(int n)
{
  int somme = 0;
  for(int i = 1; i <= sqrt(n); i++)
  {
    if(n % i == 0)
    {
      if(n/i == i)
      {
        somme += i;
      }
      else
      {
        somme += i;
        somme += (n/i);
      }
    }
  }
  return somme;
}
boolean estNeg(int n){
  return n <= 0;
}

boolean estAbondant(int n)
{
  return (sd(n) > 2*n);
}
  
boolean estPremier(int n)
{
  return sd(n) == n+1;
}
boolean estParfait(int n)
{
  return sd(n) == 2*n;
}
boolean estDefaillant(int n){
  return sd(n) < 2 * n;
}

int f1(int x){
  return x * x * n1 + x * n2 + n3;
}

int f2(int x){
  return x * x * n4 + x * n5 + n6;
}
