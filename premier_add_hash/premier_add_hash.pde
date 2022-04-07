import java.util.Map;
PGraphics pg;
PGraphics txtImg;
PGraphics txtSph;
PShape ps;
PShape psh;
PShader text;
String s;
int n1 = 0;
int n2 = 1; 
int n3 = 0;
int n4 = 0;
int n5 = 1; 
int n6 = 0;
int fig1 = 0;
int fig2 = 0;
int a;
int n;
int k;
float ang = 0;
float eyeX, eyeY,eyeZ;
int d = 200;
int dir;
//color couleur[] = new color[5];
HashMap<Integer, Integer> hm = new HashMap<Integer, Integer>();
int N1 = 627;
int N2 = 690;
int nbfig1[] = new int[N1];
int nbfig2[] = new int[N2];

void setup()
{
  text =loadShader("TextFrag.glsl","TextVertex.glsl");
  hm.put(0, color(128,128,0));
  hm.put(1, color(0,255,0));
  hm.put(2, color(255,255,0));
  hm.put(3, color(0,0,255));
  hm.put(4, color(255,0,0));
  //couleur[0] = color(128,128,0);
  //couleur[1] = color(0,255,0);
  //couleur[2] = color(255,255,0);
  //couleur[3] = color(0,0,255);
  //couleur[4] = color(255,0,0);
  for(int i = 0; i < N1; i++){
    nbfig1[i] = i + 1;
  }
  for(int i=0; i < N2; i++){
    nbfig2[i] = i + 1;
  }
  size(1200,800, P3D);
  pg = createGraphics(300,300,P2D);
  txtImg = createGraphics(40,40, P2D);
  txtSph = createGraphics(40,40);
  background(100,100,100);
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
  eyeX = width/2;
  eyeY = height/2;
  eyeZ = d;


}

void draw()
{    
    /*camera(width/2+map(mouseX, 0, width, -2*width, 2*width), 
    height/2+map(mouseY, 0, height, -height, height), 
    height/2/tan(PI*30.0 / 180.0), 
    width, height/2.0, 0, 
    0, 1, 0);*/
    //camera(width/2,height/2,0, 0,0,0,0,1,0);
    ang++;
    if (ang>=360){
      ang=0;
    }
    eyeY = (height/2)-d*(sin(radians(ang)));
    eyeX = d*cos(radians(ang));
    //perspective();
    //camera(eyeX, eyeY, eyeZ, width/2, height/2 +100, 10, 0, 1, 0);
    stroke(0);
    textSize(32);
    if(fig1 != f1(1) || fig2 != f2(1)){
      resetShader();
      drawF();
    }
    //affiche fonction
    //rotateX(frameCount/50.0);
    rotateX(PI/6);
    //camera(eyeX, eyeY, eyeZ, width/2, height/2 +100, 10, 0, 1, 0);
    //rotateY(PI/6);
    //rotateZ(PI/6);
    if(fig1 != f1(1)){
      
      stroke(0);
      fig1 = f1(1);
      pushMatrix();
      translate(width/4,height/2);
      ps = myBox(20);
      //rotate(2 * frameCount * PI/ 60.0);
      couleur(1);
      shape(ps);
      textCube(1);
      a = 1;
      n = 2;
      k = 0;
      dir = 0;
      shader(text);
      for(int i = 1; i<50; i++){
        if(i == 49)a--;
        for(int j = 0; j < a ;j++){
          ps = myBox(20);
          if(dir == 0)translate(20,0);
          if(dir == 1)translate(0,-20);
          if(dir == 2)translate(-20,0);
          if(dir == 3)translate(0,20);
          if(k == 0 && a%2 ==1 && j == a-1)translate(0,0,-20); 
          if(n < 100){
              s = "" + nbfig1[n];
              txtImg.beginDraw();
              if(estNeg(nbfig1[n])){
                txtImg.background(hm.get(0));
              }else if(estParfait(nbfig1[n])){
                txtImg.background(hm.get(1));
              }else if(estPremier(nbfig1[n])){
                txtImg.background(hm.get(2));
              }else if(estAbondant(nbfig1[n])){
                txtImg.background(hm.get(3));
              }else if(estDefaillant(nbfig1[n])){
                txtImg.background(hm.get(4));
              }
              //txtSph.background(0, 0, 0, 0);
              txtImg.textAlign(CENTER);
              txtImg.fill(0);
              txtImg.textSize(15);
              txtImg.text(s,20,20);
              txtImg.endDraw();
              ps.setTexture(txtImg);
          }else{
            resetShader();
            couleur(nbfig1[n]);
          }
          shape(ps);
          /*if(n < 100){
            textCube(n);
          }*/
          
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
    }
    println(n);
    if(fig2 != f2(1)){
        fig2 = f2(1);
        k = 0;
        n = 1;
        psh = createShape(SPHERE,15);
        pushMatrix();
        translate(3* width/4, height/2);
        //rotate(2 * frameCount * PI/ 60.0);
        noStroke();
        psh = createShape(SPHERE,15);
        couleur2(1);
        shape(psh);
        shader(text);
        for(int i = 4;i < 37; i = i + 2){
          translate(0,0,-20);
          for(float ang = -PI; ang<PI- PI/i + 0.1; ang+=PI/i) {
            pushMatrix();
            psh = createShape(SPHERE,15);
            translate(i* 5 *cos(ang), i* 5 *sin(ang));
            if(n < 100){
              s = "" + nbfig2[n];
              txtSph.beginDraw();
              if(estNeg(nbfig2[n])){
                txtSph.background(hm.get(0));
              }else if(estParfait(nbfig2[n])){
                txtSph.background(hm.get(1));
              }else if(estPremier(nbfig2[n])){
                  txtSph.background(hm.get(2));
              }else if(estAbondant(nbfig2[n])){
                txtSph.background(hm.get(3));
              }else if(estDefaillant(nbfig2[n])){
                txtSph.background(hm.get(4));
              }
              //txtSph.background(0, 0, 0, 0);
              //txtSph.textAlign(CENTER);
              txtSph.fill(0);
              txtSph.textSize(10);
              txtSph.text(s,25,25);
              txtSph.endDraw();
              noStroke();

              psh.setTexture(txtSph);

            }else{
              resetShader();
              couleur2(nbfig2[n]);
            }
            shape(psh);
            popMatrix();
            n++;
     
        }
      }
      popMatrix();
       
    }
    println(n);
}

void couleur(int n){
   if(estNeg(f1(n))){
          ps.setFill(hm.get(0));
        }else if(estParfait(f1(n))){
          ps.setFill(hm.get(1));
        }else if(estPremier(f1(n))){
          ps.setFill(hm.get(2));
        }else if(estAbondant(f1(n))){
          ps.setFill(hm.get(3));
        }else if(estDefaillant(f1(n))){
          ps.setFill(hm.get(4));
        }
}
void couleur2(int n){
  if(estNeg(f2(n))){
          psh.setFill(hm.get(0));
        }else if(estParfait(f2(n))){
          psh.setFill(hm.get(1));
        }else if(estPremier(f2(n))){
          psh.setFill(hm.get(2));
        }else if(estAbondant(f2(n))){
          psh.setFill(hm.get(3));
        }else if(estDefaillant(f2(n))){
          psh.setFill(hm.get(4));
        }
}
PGraphics textImager(String s, PGraphics pg) {
  pg.beginDraw();
  pg.clear();
  pg.background(0,0,0,0);
  pg.textAlign(CENTER);
  pg.textSize(20);
  pg.fill(0);
  pg.text(s, 25, 25);
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
    fill(100);
    noStroke();
    rect(0,0,width,80);
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
      vertex( 0, 0,  21, 0, 0);
      vertex( 20, 0,  21, 50, 0);
      vertex( 20,20,  21, 50, 50);
      vertex(0,  20,  21, 0, 50);
      vertex(0, 0,  21, 0, 0);
    endShape();
  popMatrix();
}
void mouseClicked()
{
  if(mouseX >= 120 && mouseX < 120+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n1++;
    for(int i = 0; i < N1; i++){
      nbfig1[i] += (i + 1) * (i +1);
      
    }
  }
  if(mouseX >= 120 && mouseX < 120+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n1--;
    for(int i = 0; i < N1; i++){
      nbfig1[i] -= (i + 1) * (i +1);
    }
  }
  if(mouseX >= 200 && mouseX < 200+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n2++;
    for(int i = 0; i < N1; i++){
      nbfig1[i] += i + 1;
    }
  }
  if(mouseX >= 200 && mouseX < 200+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n2--;
    for(int i = 0; i < N1; i++){
      nbfig1[i] -= i + 1;
    }
  }
  if(mouseX >= 250 && mouseX < 250+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n3++;
    for(int i = 0; i < N1; i++){
      nbfig1[i]++;
    }
  }
  if(mouseX >= 250 && mouseX < 250+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n3--;
    for(int i = 0; i < N1; i++){
      nbfig1[i]++;
    }
  }
  if(mouseX >= width-200 && mouseX < width-200+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n4++;
    for(int i = 0; i < N2; i++){
      nbfig2[i]+= (i + 1) * (i + 1);
    }
  }
  if(mouseX >= width-200 && mouseX < width-200+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n4--;
    for(int i = 0; i < N2; i++){
      nbfig2[i]-= (i + 1) * (i + 1);
    }
  }
  if(mouseX >= width-120 && mouseX < width-120+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n5++;
    for(int i = 0; i < N2; i++){
      nbfig2[i]+= i + 1;
    }
  }
  if(mouseX >= width-120 && mouseX < width-120+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n5--;
    for(int i = 0; i < N2; i++){
      nbfig2[i]-= i + 1;
    }
  }
  if(mouseX >= width-60 && mouseX < width-60+20 && mouseY >= 5 && mouseY < 5+20)
  {
    n6++;
    for(int i = 0; i < N2; i++){
      nbfig2[i]++;
    }
  }
  if(mouseX >= width-60 && mouseX < width-60+20 && mouseY >= 55 && mouseY < 55+20)
  {
    n6--;
    for(int i = 0; i < N2; i++){
      nbfig2[i]--;
    }
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
  a1.vertex(0, 0, 0, 0 , 0);
  a1.vertex(0,  0, size, 0 ,40);
  a1.vertex(0,  size, size, 40, 40);
  a1.vertex(0,  size, 0, 40 , 0);
  a1.endShape(CLOSE);
  
  a2.beginShape();
  a2.vertex(0, 0, size, 0 , 0);
  a2.vertex(0,  size, size, 0, 40);
  a2.vertex(size,   size, size,40 ,40);
  a2.vertex(size,  0, size,40, 0);
  a2.endShape(CLOSE);
  
  a3.beginShape();
  a3.vertex(size, 0, 0, 40, 40);
  a3.vertex(size, size, 0,0 ,40);
  a3.vertex(size, size, size,0 ,0);
  a3.vertex(size,   0, size,40,0);
  a3.endShape();
  
  a4.beginShape();
  a4.vertex(0,  0, 0,0 ,0);
  a4.vertex(0, 0, size, 0 ,40);
  a4.vertex(size, 0, size,40 ,40);
  a4.vertex(size, 0, 0,40 ,0);
  a4.endShape();
  
  a5.beginShape();
  a5.vertex(0,  size, 0 , 0, 40);
  a5.vertex(0,   size, size,0 , 0);
  a5.vertex(size,  size, size, 40, 0);
  a5.vertex(size, size, 0, 40, 40);
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
  return n <= 1;
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
