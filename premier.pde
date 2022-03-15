void setup()
{
  size(400,400, P3D);
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
