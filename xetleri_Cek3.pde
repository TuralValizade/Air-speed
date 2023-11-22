void xetlericek3()
{
  strokeWeight(4);
for ( float i = 270; i <360; i+=13.0263157895)
{
  float x = 250+175*cos(radians(i));
  float y = 250+175*sin(radians(i));
line(x,y,250,250);
}
strokeWeight(4);
for ( float i = 270; i <360; i+=2.6052631579)
{
  
  float x = 250+170*cos(radians(i));
  float y = 250+170*sin(radians(i));
line(x,y,250,250);
}
}
