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
