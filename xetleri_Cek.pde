void xetlericek()
{
  stroke(255);
  strokeWeight(4);
for ( float i = 92.3684210525; i >0; i-=13.0263157895)
{
float x = 250+175*cos(radians(i));
float y = 250+175*sin(radians(i));
line(x,y,250,250);
}
for ( float i = 92.3684210525; i >0; i-=13.0263157895/5)
{
float x = 250+170*cos(radians(i));
float y = 250+170*sin(radians(i));
line(x,y,250,250);
}
}
