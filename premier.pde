PGraphics pg;
PGraphics txtImg;
PShape ps;
PShape psh;
String s;
int n1 = 0;
int n2 = 1; 
int n3 = 0;
int n4 = 0;
int n5 = 1; 
int n6 = 0;
color couleur[] = new color[5];

void setup()
{
  couleur[0] = color(0);
  couleur[1] = color(0,255,0);
  couleur[2] = color(255,255,0);
  couleur[3] = color(0,0,255);
  couleur[4] = color(255,0,0);
  size(1600,1000, P3D);
  pg = createGraphics(300,300,P2D);
  textSize(32);
  background(100,100,100);
  drawF();
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
    /*camera(width/2+map(mouseX, 0, width, -2*width, 2*width), 
    height/2+map(mouseY, 0, height, -height, height), 
    height/2/tan(PI*30.0 / 180.0), 
    width, height/2.0, 0, 
    0, 1, 0);*/
  
    stroke(0);
    //affiche fonction
    //rotateX(frameCount/50.0);
    rotateX(PI/6);
    //rotateY(PI/6);
    //rotateZ(PI/6);
    pushMatrix();
    translate(width/4,height/2);
    ps = myBox(20);
    couleur(1);
    //rotate(2 * frameCount * PI/ 60.0);
    shape(ps);
    textCube(1);
    int a = 1;
    int n = 2;
    int k = 0;
    int dir = 0;
    
    for(int i = 1; i<50; i++){
      if(i == 49)a--;
      for(int j = 0; j < a ;j++){
        ps = myBox(20);
        if(dir == 0)translate(20,0);
        if(dir == 1)translate(0,-20);
        if(dir == 2)translate(-20,0);
        if(dir == 3)translate(0,20);
        if(k == 0 && a%2 ==1 && j == a-1)translate(0,0,-20); 
        couleur(n);
        shape(ps);
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
    popMatrix();
    k = 0;
    n = 2;
    psh = createShape(SPHERE,15);
    pushMatrix();
    translate(3* width/4, height/2);
    //rotate(2 * frameCount * PI/ 60.0);
    noStroke();
    psh = createShape(SPHERE,15);
    shape(psh);
    for(int i = 4;i < 50; i = i + 2){
      translate(0,0,-20);
      for(float ang = -PI; ang<PI; ang+=PI/i) {
        pushMatrix();
        psh = createShape(SPHERE,15);
        translate(i* 5 *cos(ang), i* 5 *sin(ang));
        if(n < 100){
          s = "" + f2(n);
          fill(0);
          textSize(5);
          text(s, i* 5 *cos(ang), i* 5 *sin(ang), 20);
        }
        couleur2(n);
        shape(psh);
        popMatrix(); 
        n++;
 
    }
  }
  popMatrix();
   
 
}

void couleur(int n){
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
}
void couleur2(int n){
  if(estNeg(f2(n))){
          fill(0,0,0);
        }else if(estParfait(f2(n))){
          fill(0,255,0);
        }else if(estPremier(f2(n))){
          fill(255,255,0);
        }else if(estAbondant(f2(n))){
          fill(0,0,255);
        }else if(estDefaillant(f2(n))){
          fill(255,0,0);
        }
}
PGraphics textImager(String s, PGraphics pg) {
  pg.beginDraw();
  //pg.background(0,0,0,0);
  pg.clear();
  pg.textAlign(CENTER);
  pg.textSize(20);
  pg.fill(0);
  pg.text(s, 20, 20);
  pg.endDraw();
  return pg;
}
void textCube(int n){
  pushStyle();
         noFill();
         noStroke();
            // make an image with clock text
         s = "" + f1(n);
         txtImg = textImager(s, pg);
        // draw the image on a cube
        textureCube(txtImg.get());
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
PShape myBox(float sideSize){
  float size = sideSize;
  PShape p = createShape(GROUP);
  PShape a1 = createShape();
  PShape a2 = createShape();
  PShape a3 = createShape();
  PShape a4 = createShape();
  PShape a5 = createShape();
  a1.beginShape();
  a1.vertex(0, 0, 0);
  a1.vertex(0,  0, size);
  a1.vertex(0,  size, size);
  a1.vertex(0,  size, 0);
  a1.endShape(CLOSE);
  
  a2.beginShape();
  a2.vertex(0, 0, size);
  a2.vertex(0,  size, size);
  a2.vertex(size,   size, size);
  a2.vertex(size,  0, size);
  a2.endShape(CLOSE);
  
  a3.beginShape();
  a3.vertex(size, 0, 0);
  a3.vertex(size, size, 0);
  a3.vertex(size, size, size);
  a3.vertex(size,   0, size);
  a3.endShape();
  
  a4.beginShape();
  a4.vertex(0,  0, 0);
  a4.vertex(0, 0, size);
  a4.vertex(size, 0, size);
  a4.vertex(size, 0, 0);
  a4.endShape();
  
  a5.beginShape();
  a5.vertex(0,  size, 0);
  a5.vertex(0,   size, size);
  a5.vertex(size,  size, size);
  a5.vertex(size, size, 0);
  a5.endShape();
  p.addChild(a1);
  p.addChild(a2);
  p.addChild(a3);
  p.addChild(a4);
  p.addChild(a5);
  return p;
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
