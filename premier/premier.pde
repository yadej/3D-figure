import java.util.Map;


PGraphics g1;
PGraphics txtImg;
PShape ps;
PShape pstext;
PShape psh;
PShape pshtext;
PShader text;
PShader norm;
PShader picking;
HashMap<String,Integer> hm = new HashMap<String,Integer>();
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
int c;
int boucle1 = 22;
int boucle2 = 15;
int ang = 0;
int rate = 10;
float eyeX, eyeY,eyeZ;
int d = 200;
int dir;
color couleur[] = new color[5];
int N1 = 627;
int N2 = 690;
int nbfig1[] = new int[N1];
int nbfig2[] = new int[N2];
PShape cubTab1[] = new PShape[max(N1,N2)];
PShape cubPgraphics1[] = new PShape[max(N1,N2)];
PShape cubText1[] = new PShape[100];

void setup()
{
  text = loadShader("TextFrag.glsl","TextVertex.glsl");
  picking = loadShader("PickerFrag.glsl","PickerVert.glsl");
  norm = loadShader("normalFrag.glsl","normalVert.glsl");
  couleur[0] = color(128,128,0);
  couleur[1] = color(0,255,0);
  couleur[2] = color(255,255,0);
  couleur[3] = color(0,100,200);
  couleur[4] = color(255,0,0);
  for(int i = 0; i < max(N1,N2); i++){
    cubTab1[i] = myBoxG1(20, i + 1);
    cubPgraphics1[i] = myBoxG1(20, i + 1);
  }
  for(int i = 0; i < N1; i++){
    nbfig1[i] = i + 1;
  }
  for(int i=0; i < N2; i++){
    nbfig2[i] = i + 1;
  }
  for(int i=0; i < 100; i++){
    cubText1[i] = myBoxG1(20, i + 1);
  }
  size(1200,800, P3D);
  g1 = createGraphics(1200,800,P3D);
  norm.set("idselect", 1.0f);
  picking.set("idselect", 0.0f);
  txtImg = createGraphics(40,40, P2D);
  background(100,100,100);
  frameRate(10);

}

void draw()
{     //<>//
  
    
    
    ang += rate;
    
    if (ang>=360*50){
      ang =  ang%(360*50);
    }
    background(100);
    textSize(32);
    if(fig1 != f1(1) || fig2 != f2(1)){
      drawF();
    }
    //affiche fonction
    pushMatrix();
    rotateX(PI/6);
    
    //camera(eyeX, eyeY, eyeZ, width/2, height/2 +100, 10, 0, 1, 0);
    //rotateY(PI/6);
    //rotateZ(PI/6);
    
      stroke(128);
      pushMatrix();
      translate(width/4,height/2);
      rotate(radians(ang * PI/ 50.0));
      
      ps = cubTab1[0];
      //rotate(2 * frameCount * PI/ 60.0);
      c = couleur1(nbfig1[0]);
      s = "" + nbfig1[0];
      shader(norm);
      ps.setFill(c); //<>//
      shape(ps);
      resetShader();
      shader(text);
      pstext = cubText1[0];
      txtImg.beginDraw();
      txtImg.background(c,0);
      txtImg.textAlign(CENTER);
      txtImg.fill(0);
      txtImg.textSize(15);
      txtImg.text(s,20,20);
      txtImg.endDraw();
      pstext.setTexture(txtImg);
      shape(pstext);
      resetShader();
      
      a = 1; //<>//
      n = 2;
      k = 0;
      dir = 0;
      for(int i = 1; i<boucle1; i++){
        if(i == boucle1-1)a--;
        for(int j = 0; j < a ;j++){
          ps = cubTab1[n-1];
          if(dir == 0)translate(20,0);
          if(dir == 1)translate(0,-20);
          if(dir == 2)translate(-20,0);
          if(dir == 3)translate(0,20);
          if(k == 0 && a%2 ==1 && j == a-1)translate(0,0,-20);
          c = couleur1(nbfig1[n-1]);
          if(n < 100){
              shader(norm);
              ps.setFill(c);
              shape(ps);
              resetShader();
              pstext = cubText1[n-1];
              shader(text);
              txtImg.beginDraw();
              txtImg.clear();
              s = "" + nbfig1[n-1];
              txtImg.background(c, 0);
              txtImg.textAlign(CENTER);
              txtImg.fill(0);
              txtImg.textSize(15);
              txtImg.text(s,20,20);
              txtImg.endDraw();
              pstext.setTexture(txtImg);
              shape(pstext);
              resetShader();
          }else{
            shader(norm);
            ps.setFill(c);
            shape(ps);
            resetShader();
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
        n = 1;
        pushMatrix();
        translate(3* width/4, height/2);
        rotate(radians(ang * PI/ 50.0));
        psh = cubTab1[n-1];
        c = couleur1(nbfig2[0]);
        shader(norm);
        psh.setFill(c);
        shape(psh);
        resetShader();
        pshtext = cubText1[n-1];
        shader(text);
        txtImg.beginDraw();
        s = "" + nbfig2[n-1];
        txtImg.background(c,0);
        txtImg.textAlign(CENTER);
        txtImg.fill(0);
        txtImg.textSize(15);
        txtImg.text(s,20,20);
        txtImg.endDraw();
        pshtext.setTexture(txtImg);
        shape(pshtext);
        resetShader();
        n++;
        for(int i = 4;i < boucle2; i = i + 2){
          translate(0,0,-20);
          for(float angle = -PI; angle<PI- PI/i + 0.1; angle+=PI/i) {
           c = couleur1(nbfig2[n-1]);
           pushMatrix();
           psh = cubTab1[n-1];
           translate(i* 5 *cos(angle), i* 5 *sin(angle));
           if(n < 100){
             shader(norm);
             psh.setFill(c);
             shape(psh);
             resetShader();        
             shader(text);
             pshtext = cubText1[n-1];
             s = "" + nbfig2[n-1];
             txtImg.beginDraw();
             txtImg.background(c,0);
             txtImg.textAlign(CENTER);
             txtImg.fill(0);
             txtImg.textSize(15);
             txtImg.text(s,20,20);
             txtImg.endDraw();
             pshtext.setTexture(txtImg);
             shape(pshtext);
             resetShader();
            }else{
              shader(norm);
              psh.setFill(c);
              shape(psh);
              resetShader();
            }
            popMatrix();
            n++;
     
        }
      }
      popMatrix();  
      
     popMatrix();
}

int couleur1(int n){
   String coul = "" + n;
   if(hm.containsKey(coul)){
     return hm.get(coul);
   }
   if(estNeg(n)){
          hm.put(coul,couleur[0]);
   }else if(estParfait(n)){
          hm.put(coul,couleur[1]);
   }else if(estPremier(n)){
          hm.put(coul,couleur[2]);
   }else if(estAbondant(n)){
          hm.put(coul,couleur[3]);
   }else if(estDefaillant(n)){
       hm.put(coul,couleur[4]);
   }
   return hm.get(coul);
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
      nbfig1[i] -= (i + 1);
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
      nbfig1[i]--;
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
      nbfig2[i]-= (i + 1);
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
  
  int mp = get(mouseX,mouseY);
  if(mouseY < 50){
    
  }else if( red(mp) == 100 ){
    norm.set("idselect", 0.0f);
  }else{
 
  g1.loadPixels();
  g1.beginDraw();
  g1.background(color(-1));
  g1.shader(picking);
  g1.rotateX(PI/6);
  g1.pushMatrix();
      g1.translate(width/4,height/2);
      g1.rotate( radians(ang * PI/ 50.0));
      //g1.rotate(frameCount * PI/ 50.0);
      n = 1;
      //ps = cubTab1[n-1];
      //ps = myBoxG1(20,n);
      ps = cubPgraphics1[n-1];
      //rotate(2 * frameCount * PI/ 60.0);
      g1.shape(ps);
      a = 1;
      k = 0;
      dir = 0;
      n++;
      for(int i = 1; i<boucle1; i++){
        if(i == boucle1-1)a--;
        for(int j = 0; j < a ;j++){
          //ps = cubTab1[n-1];
          //ps = myBoxG1(20,n);
          ps = cubPgraphics1[n-1];
          if(dir == 0)g1.translate(20,0);
          if(dir == 1)g1.translate(0,-20);
          if(dir == 2)g1.translate(-20,0);
          if(dir == 3)g1.translate(0,20);
          if(k == 0 && a%2 ==1 && j == a-1)g1.translate(0,0,-20);
          
          g1.shape(ps);
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
      g1.popMatrix();
        k = 0;
        n = 1;
        g1.pushMatrix();
        g1.translate(3* width/4, height/2);
        g1.rotate( radians(ang * PI/ 50.0));
        //rotate(frameCount * PI/ 50.0);
        //psh = cubTab2[n-1];
        //psh = myBoxG1(20,n);
        psh = cubPgraphics1[n-1];
        g1.shape(psh);
        n++;
        for(int i = 4;i < boucle2; i = i + 2){
          g1.translate(0,0,-20);
          for(float angle = -PI; angle<PI- PI/i + 0.1; angle+=PI/i) {
            g1.pushMatrix();
            //psh = cubTab2[n-1];
            //psh = myBoxG1(20,n);
            psh = cubPgraphics1[n-1];
            g1.translate(i* 5 *cos(angle), i* 5 *sin(angle));
            g1.shape(psh);
            g1.popMatrix();
            n++;
     
        }
      }
      g1.popMatrix();
   int pixel = g1.get(mouseX, mouseY);
  g1.resetShader();
  g1.endDraw();
 
  println(red(pixel) + green(pixel) * 256 + blue(pixel) * 256 * 256);
  println(red(pixel),green(pixel),blue(pixel));
  float NewPos = red(pixel) + green(pixel) * 256 + blue(pixel) * 256 * 256;
  if(red(pixel) != 128.0){
    norm.set("idselect", (float)NewPos);
    picking.set("idselect", (float)NewPos);
    }
  }
  
}

PShape myBoxG1(float sideSize, int n){
  float size = sideSize;
  PShape p = createShape(GROUP);
  PShape a1 = createShape();
  PShape a2 = createShape();
  PShape a3 = createShape();
  PShape a4 = createShape();
  PShape a5 = createShape();
  a1.beginShape();
  a1.attrib("idnum", (float)n);
  a1.vertex(0, 0, 0, 0 , 0);
  a1.vertex(0,  0, size, 0 ,40);
  a1.vertex(0,  size, size, 40, 40);
  a1.vertex(0,  size, 0, 40 , 0);
  a1.endShape(CLOSE);
  
  a2.beginShape();
  a2.attrib("idnum", (float)n);
  a2.vertex(0, 0, size, 0 , 0);
  a2.vertex(0,  size, size, 0, 40);
  a2.vertex(size,   size, size,40 ,40);
  a2.vertex(size,  0, size,40, 0);
  a2.endShape(CLOSE);
  
  a3.beginShape();
  a3.attrib("idnum", (float)n);
  a3.vertex(size, 0, 0, 40, 40);
  a3.vertex(size, size, 0,0 ,40);
  a3.vertex(size, size, size,0 ,0);
  a3.vertex(size,   0, size,40,0);
  a3.endShape();
  
  a4.beginShape();
  a4.attrib("idnum", (float)n);
  a4.vertex(0,  0, 0,0 ,0);
  a4.vertex(0, 0, size, 0 ,40);
  a4.vertex(size, 0, size,40 ,40);
  a4.vertex(size, 0, 0,40 ,0);
  a4.endShape();
  
  a5.beginShape();
  a5.attrib("idnum", (float)n);
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

PShape myBoxG1(float sideSize, int n, PGraphics pg){
  float size = sideSize;
  PShape p = createShape(GROUP);
  PShape a1 = createShape();
  PShape a2 = createShape();
  PShape a3 = createShape();
  PShape a4 = createShape();
  PShape a5 = createShape();
  a1.beginShape();
  a1.attrib("idnum", (float)n);
  a1.fill(0,0,0,0);
  a1.texture(pg);
  a1.vertex(0, 0, 0, 0 , 0);
  a1.vertex(0,  0, size, 0 ,40);
  a1.vertex(0,  size, size, 40, 40);
  a1.vertex(0,  size, 0, 40 , 0);
  a1.endShape(CLOSE);
  
  a2.beginShape();
  a2.attrib("idnum", (float)n);
  a2.fill(0,0,0,0);
  a2.texture(pg);
  a2.vertex(0, 0, size, 0 , 0);
  a2.vertex(0,  size, size, 0, 40);
  a2.vertex(size,   size, size,40 ,40);
  a2.vertex(size,  0, size,40, 0);
  a2.endShape(CLOSE);
  
  a3.beginShape();
  a3.attrib("idnum", (float)n);
  a3.fill(0,0,0,0);
  a3.texture(pg);
  a3.vertex(size, 0, 0, 40, 40);
  a3.vertex(size, size, 0,0 ,40);
  a3.vertex(size, size, size,0 ,0);
  a3.vertex(size,   0, size,40,0);
  a3.endShape();
  
  a4.beginShape();
  a4.attrib("idnum", (float)n);
  a4.fill(0,0,0,0);
  a4.texture(pg);
  a4.vertex(0,  0, 0,0 ,0);
  a4.vertex(0, 0, size, 0 ,40);
  a4.vertex(size, 0, size,40 ,40);
  a4.vertex(size, 0, 0,40 ,0);
  a4.endShape();
  
  a5.beginShape();
  a5.attrib("idnum", (float)n);
  a5.fill(0,0,0,0);
  a5.texture(pg);
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

void keyPressed(){
  if(key == 'a' && boucle1<50){
    boucle1 += 4;  
  }
  if(key == 'b' && boucle1 > 17){
    boucle1 -= 4;
  }
  if(key == 'a' && boucle2< 36){
    boucle2 += 2;  
  }
  if(key == 'b' && boucle2 > 9){
    boucle2 -= 2;
  }
  if(key == 'w'){
    rate+=5;
  }
  if(key == 'x'){
    rate-=5;
  }
  if(key == 'c'){
    rate = 0;
  }
}
