part of fronton;

const num RADIUS=10;
const num SPEED=20;
const num RACKET_LENGHT=70;
const num RACKET_WIDTH=10;

class Board{
  int width,height;
  Racket r;
  Ball b;
  int dx,dy;
  int fallos=0;
  CanvasRenderingContext2D context;
  ParagraphElement resultadoElement;
  
  Board(CanvasElement canvas,this.resultadoElement){
    context=canvas.context2D;
    width=canvas.width;
    height=canvas.height;
  }
  
  void init(){
    dx=5;
    dy=5;
    b=new Ball((width/2).round(),(height/2).round(),RADIUS,this);
    r = new Racket((width/2).round(),height-RACKET_WIDTH,RACKET_LENGHT,RACKET_WIDTH,this);
    new Timer.periodic(new Duration(milliseconds:SPEED), (e)=>redraw());
  }
  void clear(){
    context.clearRect(0,0,width,height);
  }
  
  void redraw(){
    clear();
    b.draw();
    r.draw();
    if ((b.x-RADIUS)<=0 || (b.x+RADIUS)>=width) dx=-dx;
    if ((b.y-RADIUS)<=0) dy=-dy;
    if ((b.y+RADIUS)>=height){
      b.x=(width/2).round();
      b.y=(height/2).round();
      fallos+=1;
      resultadoElement.text="Fallos : "+fallos.toString();
    }
    if ((b.x>=r.x && b.x<=(r.x+RACKET_LENGHT)) && ((b.y+RADIUS)>=height-RACKET_WIDTH))
      dy=-dy;
    if (r._leftArrow)r.x-=5;
    if (r._rightArrow)r.x+=5;    
    if(r.x<0)r.x=0;
    else if ((r.x+RACKET_LENGHT)>=width)r.x=width-RACKET_LENGHT;

    b.x+=dx;
    b.y+=dy;
  }
}