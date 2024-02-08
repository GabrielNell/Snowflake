class CFlake extends Flake {
  float r, g, b;
  CFlake() {
    r = (float)(Math.random() * 206 + 50);
    g = (float)(Math.random() * 206 + 50);
    b = (float)(Math.random() * 206 + 50);
  }
  
  void show() {
    fill(r, g, b, 150);
    noStroke();
    ellipse(x, y, dia, dia);
  }
}
