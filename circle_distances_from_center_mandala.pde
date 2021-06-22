int[][] grid;
int cols = 201;

int radius = 0;

int xoff; 
int yoff;

float w;
int center = ceil(cols/2);

int blackWhite = 1;


void setup() {
  size(1005, 1005);

  w = width / (float)cols;
  grid = new int[cols][cols];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < cols; j++) {
      grid[i][j] = 0;
    }
  }
}


void draw() {
  colorMode(RGB);
  background(#C19A6B);

  noStroke();  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < cols; j++) {
      colorMode(RGB);
      if (grid[i][j] == 0) {
        continue;
      } else if (grid[i][j] < 0) {
        fill(255);
      } else {
        //colorMode(HSB);
        //float hue = map(atan2(center-j, center-i), -PI, PI, 0, 255);
        //fill(hue, 200, 255);
        fill(0);
      }
      //fill(255);
      //if((i+j) % 2 == 0){
      //  fill(0);
      //}

      //if (i == center && j == center){
      //  fill(255, 0, 255);
      //}
      //ellipseMode(CORNER);
      //ellipse(i*w+w/2.0, j*w+w/2.0, w, w);
      
      rect(i*w, j*w, w, w);
      if (grid[i][j] < 0) {
        fill(255);
      } else {
        fill(0);
      }
      //ellipse(i*w+w/2.0, j*w+w/2.0, w/2.0, w/2.0);
      
      //rect(i*w, j*w, w, w);
    }
  }

  for (int i = 0; i < 100; i++) {
    nextIteration();
  }
}


boolean searchForLength(int num) {
  for (int i = 0; i <= center; i++) {
    for (int j = 0; j <= center; j++) {     
      if (distance(i, j) == num) {
        xoff = center - i;
        yoff = center - j;
        return true;
      }
    }
  }
  return false;
}

int distance(int i, int j) {
  int dx = center - i;
  int dy = center - j;

  return dx*dx + dy*dy;
}



void nextIteration() {
  if(radius >= center*center){
    return;
  }
  
  
  //grid[center+xoff][center+yoff] = blackWhite;
  //grid[center+xoff][center-yoff] = blackWhite;
  //grid[center-xoff][center+yoff] = blackWhite;
  //grid[center-xoff][center-yoff] = blackWhite;

  //grid[center+yoff][center+xoff] = blackWhite;
  //grid[center+yoff][center-xoff] = blackWhite;
  //grid[center-yoff][center+xoff] = blackWhite;
  //grid[center-yoff][center-xoff] = blackWhite;

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < cols; j++) {
      if (distance(i, j) == radius){
        //if(radius % 2 == 0){
        //  grid[i][j] = 1;
        //} else {
        //  grid[i][j] = -1;
        //} 
        grid[i][j] = blackWhite;
      }
    }
  }
  
  
  

  for (int i = 0; i < 100; i++) {
    if (searchForLength(++radius)) {
      blackWhite *= -1;
      break;
    }
  }
}

void mouseClicked() {
  save("output1.png");
  //nextIteration();
  //draw();
}