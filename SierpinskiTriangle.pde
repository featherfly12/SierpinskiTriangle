public void setup() {
  size(500, 500);  
  background(0);  
  stroke(250);    
  drawSierpinski(); 
}

public void draw() {
}

public void mouseDragged() {
  drawSierpinski(); 
}

public void drawSierpinski() {
  background(0); 

  float len = 400; 
  float height = (float)(Math.sqrt(3) / 2 * len);

  float x = (width - len) / 2;
  float y = height + (height / 4);

  sierpinski((int) x, (int) y, (int) len, 5); 
}

public void sierpinski(int x, int y, int len, int depth) {
  if (depth == 0) {
    drawTriangle(x, y, len); 
  } else {
    int halfLen = len / 2;
    float height = (float)(Math.sqrt(3) / 2 * halfLen);

    sierpinski(x, y, halfLen, depth - 1); 
    sierpinski(x + halfLen, y, halfLen, depth - 1); 
    sierpinski(x + halfLen / 2, y - (int) height, halfLen, depth - 1); 
  }
}

public void drawTriangle(int x, int y, int len) {
  float height = (float)(Math.sqrt(3) / 2 * len);

  fill((int)(Math.random() * 255), 
       (int)(Math.random() * 255), 
       (int)(Math.random() * 255));

  beginShape();
  vertex(x, y);
  vertex(x + len, y);
  vertex(x + len / 2, y - height);
  endShape(CLOSE);
}
