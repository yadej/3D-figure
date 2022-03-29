int sideSize = 10;
void setup()
{
  size(800,600,P3D);
}

void draw()
{
  //rotateX(PI/6);
  //int a = 1;
  int n = 2;
  int k = 0;
  int dir2 = 0;
  sphereDetail(5);
  translate(width/2, height/2);

  sphere(6);
  for(int i = 4;i < 50; i = i + 2){
    translate(0,0,-20);
    for(float a = -PI; a<PI; a+=PI/i) {
      pushMatrix();
      translate(i* 5 *cos(a), i* 5 *sin(a));
      sphere(6);
      popMatrix(); 
 
    }
  }
}
