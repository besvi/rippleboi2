int cols, rows, x, y;
float[][] current, previous;
float dampening = 0.90;

void setup() {
  colorMode(HSB,360,360,360);
  size(500, 500);
  cols = width;
  rows = height;

  current = new float[cols][rows];
  previous = new float[cols][rows];
}
void mouseClicked() {
  previous[mouseX][mouseY] = 300;
}
void draw() {
  background(0,0,0);
  loadPixels();
  for (int i = 1; i < cols-1; i++) {
    for (int j = 2; j < rows-1; j++) {
      current[i][j] = (
        previous[i-1][j] +
        previous[i+1][j] +
        previous[i][j-1] +
        previous[i][j+1])/2 -
        current[i][j];
      current[i][j] = current[i][j] * dampening;
      int index = i + j * cols;
      pixels[index] = color(current[i][j] * mouseX, current[i][j] * mouseY,current[i][j] * 600);
    }
  }
  updatePixels();
  float[][] temp = previous;
  previous = current;
  current = temp;
}
