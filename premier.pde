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


/*void construitFigure()
{
  for(int i = 0; i <= 10; i++)
  {
    for(int j = 0; j <= 10; j++)
    {
      print(j);
    }
    print('\n');
  }
}*/

/*boolean estPremier(int n)
{
  if(n<= 1)
  {
    return false;
  }
  for(int i = 2; i <= sqrt(n); i++)
  {
    if(n % i == 0)
    {
      return false;
    }
  }
  return true;
}

boolean estParfait(int n)
{
  int somme = 1;
  for(int i = 2; i*i<=n; i++)
  {
    if(n%i == 0)
    {
      if(i*i != n)
      {
        somme = somme + i + n/i;
      }
      else
      {
        somme = somme + i;
      }
    }
    if(somme == n && n != 1)
    {
      return true;
    }
  }
  return false;
}*/

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
