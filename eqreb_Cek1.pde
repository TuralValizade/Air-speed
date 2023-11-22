void eqrebcek1()
{

strokeWeight(2);
stroke(255,0,0);;
beginShape();
fill(255,0,0);

vertex(250+10*cos(radians(a-40)),250+10*sin(radians(a-40)));
vertex(250+10*cos(radians(a+40)),250+10*sin(radians(a+40)));
vertex(250+130*cos(radians(a+3)),250+130*sin(radians(a+3)));
vertex(250+160*cos(radians(a)),250+160*sin(radians(a)));
vertex(250+130*cos(radians(a-3)),250+130*sin(radians(a-3)));
vertex(250+10*cos(radians(a-40)),250+10*sin(radians(a-40)));

endShape();

}
