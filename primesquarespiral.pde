float x, y;
float ang, a, b;
int counter = 0;
int len, current, direction;
PVector pos;
int step=1;

void setup() {
  //size(500, 500);
  fullScreen();
  background(0);
  x=0;
  y=0;
  len = 0;
  current = 0;
  counter=1;
  pos=new PVector(0, 0);
  direction=0;
  
}

void draw() {
//}
//void mousePressed() {
  boolean p=false;
  println(counter);
  if (counter<5000000) {
    float r;
    translate(width/2, height/2); 
    //r= a + b * ang;
    //x=r*cos(ang);
    //y=r*sin(ang);
    for (int c=0; c<10000; c++) {



      println(counter);
      getNext();
      //if (counter==1) {
      //  textSize(10);
      //  fill(255, 0, 0);
      //  text("1", 1, 1);
      //}
      p =isPrime(counter);
      if (p) {
        stroke(255);//,0,0);
        fill(255);
        //ellipse(pos.x/2, pos.y/2, step/2, step/2);
        point(pos.x/2, pos.y/2);
      } else { 
        //stroke(255, 0, 0);
        //point(pos.x/2, pos.y/2);
      }      
      counter++;
    }
  }
  //println(x);
  //println(y);

  //ang+=.075;
  //println(counter + ":" + p);
}
boolean inclen = true;
int inclencount =0;
void getNext() {
  println("CURENT:" + current);
  println("LEN:"+len);
  println("dir:"+direction);
  if (direction==0) {
    pos.x+=step;
  } else if (direction==1) {
    println("TEST");
    pos.y-=step;
  } else if (direction==2) {
    pos.x-=step;
  } else if (direction==3) {
    pos.y+=step;
  }  
  if (current>len) {
    println("changeDirection");
    incrementDirection();
    current=0;
    if (inclen && inclencount ==1) {
      len++;
    }
    inclencount ++;
    if (inclencount >1) {
      inclencount=0;
    }
  }
  current++;
}
void incrementDirection() {
  direction++;
  if (direction>3) {
    direction=0;
  }
  println("direction: " + direction);
}
//checks whether an int is prime or not.
boolean isPrime(int n) {
  //check if n is a multiple of 2
  if (n%2==0&& n>2) return false;
  //if not, then just check the odds
  for (int i=3; i*i<=n; i+=2) {
    if (n%i==0)
      return false;
  }
  return true;
}
