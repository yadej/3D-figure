void setup()
{
  size(400,400, P3D);
  println("hello world");
  int a = 5;
  println(estPremier(a));
  construitFigure();
}


void construitFigure()
{
  for(int i = 0; i <= 10; i++)
  {
    for(int j = 0; j <= 10; j++)
    {
      print(j);
    }
    print('\n');
  }
}

boolean estPremier(int n)
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
  
