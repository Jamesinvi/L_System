 //<>// //<>//
float angle = radians(24);
String rule1;
String rule2;
String nextStructure;
String currStructure = "-X";
int generation = 1;
int maxDepth = 0;

void setup() {
  size(800, 600);
  background(0);
  rule1 = "F+[[X]-X]-F[-FX]+X";
  rule2 = "FF";
  colorMode(RGB);
  noLoop();
}

void mousePressed() {
  nextStructure="";
  maxDepth=0;
  for (int i = 0; i< currStructure.length(); i++) {
    char c = currStructure.charAt(i);
    if (c == 'F') {
      nextStructure+=rule2;
    } else if (c == 'X') {
      nextStructure+=rule1;
    } else {
      nextStructure+= c;
    }
  }
  currStructure=nextStructure;
  generation++;
  redraw();
}

void draw() {
  background(25);
  stroke(255);
  translate(width/5, height);
  float originalLen = 500 * pow(0.5f, generation);
  float len = originalLen;
  int depth=0;
  for (int i = 0; i<currStructure.length(); i++) {
    char c = currStructure.charAt(i);
    if (c == 'F') {
      len = originalLen * pow(0.95f, depth);
      stroke(255, 255, 255);
      line(0, 0, 0, -len);
      translate(0, -len);
    } else if (c == '-') {
      rotate(angle);
    } else if (c == '+') {
      rotate(-angle);
    } else if (c == '[') {
      pushMatrix();
      depth++;
    } else if (c == ']') {
      popMatrix();
      depth--;
    }
  }
}

void keyPressed() {
  redraw();
  if (keyCode==ENTER) {
    saveFrame("frame-###.jpeg");
  }
}
