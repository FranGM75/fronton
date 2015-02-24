part of fronton;

class Racket{
  int x,y;
  int width,height;
  Board b;
  bool _leftArrow=false;
  bool _rightArrow=false;
  Racket(this.x,this.y,this.width,this.height,this.b){
    document.onKeyDown.listen(_KeyDown);
    document.onKeyUp.listen(_KeyUp);
   }
  
  void draw(){
    b.context.beginPath();
    b.context.rect(x, y, width, height);
    b.context.fill();
    b.context.closePath();
  }
  _KeyDown(event){
    if(event.keyCode==39)_rightArrow=true;
    if(event.keyCode==37)_leftArrow=true;    
  }
  _KeyUp(event){
    if(event.keyCode==39)_rightArrow=false;
    if(event.keyCode==37)_leftArrow=false;        
  }
}