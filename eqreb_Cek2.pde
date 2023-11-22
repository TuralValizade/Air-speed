void eqrebcek2 ()
{  strokeWeight(2);
  stroke(255,250,240);
  fill(255,250,240);
  
beginShape();
vertex(250+165*cos(radians(z)),250+165*sin(radians(z)));
vertex(250+150*cos(radians(z-3)),250+150*sin(radians(z-3)));
vertex(250+130*cos(radians(z-3)),250+130*sin(radians(z-3)));
vertex(250+130*cos(radians(z-1)),250+130*sin(radians(z-1)));
vertex(250+10*cos(radians(z-1)),250+10*sin(radians(z-1)));
vertex(250+10*cos(radians(z+19)),250+10*sin(radians(z+19)));
vertex(250+130*cos(radians(z+1)),250+130*sin(radians(z+1)));
vertex(250+130*cos(radians(z+3)),250+130*sin(radians(z+3)));
vertex(250+150*cos(radians(z+3)),250+150*sin(radians(z+3)));
vertex(250+165*cos(radians(z)),250+165*sin(radians(z)));
endShape();

}
