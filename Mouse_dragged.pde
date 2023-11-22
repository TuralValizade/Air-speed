void mouseDragged() { // Move black circle
  dragYprev=dragYcurr;
  dragYcurr = mouseY;
  if((dragYcurr-dragYprev)>0)
  {
    println(">0");
    
  }
  else
  {
    println("<0");
 
  }
}
