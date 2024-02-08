float dia = 6;
float spd = 3;
float spread = 6;  //should be even for balanced spread
int spokes = 6;
Flake cur;  //current flake
ArrayList<Flake> flakes;

void setup() {
  size(800, 800);
  flakes = new ArrayList<Flake> ();
  createAddFlake();
}

void draw() {
  translate(width/2, height/2);
  background(0);
  while (!cur.stopped() && !cur.collided()) {
    cur.move();
  }
  showFlakes();
  createAddFlake();
}


void showFlakes() {
  for (int i = 0; i < spokes; i++) {
    rotate(2 * PI/spokes);
    for (Flake f : flakes) {
      f.show();
    }
  }
}

void createAddFlake() {
  if (Math.random() >= 0.5) {
    cur = new Flake();
  } else {
    cur = new CFlake();
    cur.d *= cur.d*2;
  }

  flakes.add(cur);
  if (cur.collided()) {
    flakes.clear();
  }
}

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

class Flake {
  float x, y, d;
  Flake() {
    x = width/2-dia;
    y = 0;
    d = dia;
  }

  void show() {
    fill(255, 255, 255, 150);
    noStroke();
    ellipse(x, y, dia, dia);
  }

  void move() {
    x -= spd;
    y += (int)(Math.random()*(spread+1))-spread/2;
  }

  boolean stopped() {
    boolean res = false;
    if (x <= dia) {
      res = true;
    }
    return res;
  }

  boolean collided() {
    boolean ret = false;
    for (Flake f : flakes) {
      if (this != f) {
        if (dist(f.x, f.y, x, y) <= dia) {
          ret = true;
          continue;
        }
      }
    }
   return ret;
  }
}
