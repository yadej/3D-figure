void setup()
{
  size(1000,1000, P3D);
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

    //rotateX(frameCount/50.0);
    rotateX(PI/6);
    translate(width/2,height/2, 90);
    fill(0,0,0);
    box(20);
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
        if(estParfait(n)){
          fill(0,255,0);
        }else if(estPremier(n)){
          fill(255,255,0);
        }else if(estAbondant(n)){
          fill(0,0,255);
        }else if(estDefaillant(n)){
          fill(255,0,0);
        }
        box(20);
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
