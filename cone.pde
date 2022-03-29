void setup()
{
  size(800,600,P3D);
}

void draw()
{
  int a = 1;
  int n = 2;
  int k = 0;
  int dir2 = 0;
  sphereDetail(1);
  translate(width/2, height/2);
  sphere(6);
  for(int i = 1; i < 50; i++)
  {
    for(int j = 0; j < a; j++)
    {  
      if(dir2 == 0)
      {
        translate(10,-10);
      }
      if(dir2 == 1)
      {
        translate(-10,0);
      }
      if(dir2 == 3)
      {
        translate(-10,10);
      }
      if(dir2 == 4)
      {
        translate(10,10);
      }
      if(dir2 == 5 && j <= a -1)
      {
        translate(10,-10);
      }
      sphere(6);
      n++;
      
    }
    dir2 = (dir2 + 1) % 6;
    if(dir2 == 5)a++;
    
  } 
}
