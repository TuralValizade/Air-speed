void xetlericek2()
{
stroke(255);
strokeWeight(4); 
for ( float z=270 ; z >270-6*22.5 ; z-=22.5)
{
float x = 250+175*cos(radians(z));
float y = 250+175*sin(radians(z));
line(x,y,250,250);
}
strokeWeight(4);
for ( float z=157.5 ; z <270-22.5 ; z+=22.5/5)
{
float x = 250+170*cos(radians(z));
float y = 250+170*sin(radians(z));
line(x,y,250,250);
}
}
