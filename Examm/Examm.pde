ArrayList<PrideFlag> flags = new ArrayList<PrideFlag>(); 

void setup() 
{
  size(600, 400); 
  for (int i = 0; i < 10; i++) 
  { 
    flags.add(new PrideFlag(random(width), random(height), random(50, 150), random(50, 150), random(-5, 5), random(-5, 5))); 
    
  }
}

void draw() 
{
  background(255); 
  for (int i = 0; i < flags.size(); i++) 
  { 
    flags.get(i).display(); 
    flags.get(i).move(); 
    flags.get(i).bounce(); 
    flags.get(i).resize(); 
  }
}

class PrideFlag {
  float x, y, w, h, dx, dy;
  color[] colors = {
    #FF0018, 
    #FFA52C, 
    #FFFF41, 
    #008018, 
    #0000F9, 
    #86007D  
  };
  
  PrideFlag(float x, float y, float w, float h, float dx, float dy) 
  {
    this.x = x; 
    this.y = y; 
    this.w = w; 
    this.h = h;
    this.dx = dx; 
    this.dy = dy; 
  }
  
  void display() 
  {
    float stripeHeight = h / colors.length; 
    for (int i = 0; i < colors.length; i++) 
    {
      fill(colors[i]); 
      rect(x, y + i*stripeHeight, w, stripeHeight); 
    }
  }
  
  void move() 
  {
    x += dx; 
    y += dy; 
  }
  
  void bounce()
  {
    if (x < 0 || x + w > width) 
    { 
      dx *= -1; 
    }
    if (y < 0 || y + h > height) 
    { 
      dy *= -1; 
    }
  }
  
  void resize() 
  {
    if (random(1) < 0.01) 
    { 
      w = random(50, 250);
      h = random(50, 150);
    }
  }
}
