void xetlericek1()
{
  stroke(255);
  strokeWeight(4);
for ( float i=157.5 ; i >90 ; i-=13.0263157895)
{
  float x = 250+175*cos(radians(i));
  float y = 250+175*sin(radians(i));
line(x,y,250,250);
}
for ( float i=157.5 ; i >90 ; i-=13.0263157895/5)
{
  float x = 250+170*cos(radians(i));
  float y = 250+170*sin(radians(i));
line(x,y,250,250);
}

}
