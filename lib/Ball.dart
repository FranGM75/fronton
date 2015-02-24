part of fronton;

class Ball{
  int x,y;
  int radius;
  Board b;
  Ball(this.x,this.y,this.radius,this.b);
  
  void draw(){
    b.context.beginPath();
    b.context.arc(x,y,radius,0,2*PI);
    b.context.fill();
    b.context.closePath();
  }
  
}