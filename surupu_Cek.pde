void surupu_cek()
{
//............şurupun çevrə hissəsi
noFill();
stroke(0);
strokeWeight(0.005);
ellipse(92,86,30,30);
ellipse(408,86,30,30);
ellipse(92,414,30,30);
ellipse(408,414,30,30);
//................şurupun içi-  x-lar 
strokeWeight(5);
line (87,81,97,91);
line (97,81,87,91);
line (413,81,403,91);
line (403,81,413,91);
line (87,419,97,409);
line (97,419,87,409);
line (413,419,403,409);
line (403,419,413,409);
}
