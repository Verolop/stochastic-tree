void setup() {
  size(500, 500);
  newTree();
}

void draw() {
  noLoop();
}

void mousePressed() {
  newTree();
  redraw();
}

void newTree() {
  background(255,105, 180);
  fill(0);
  text("Click to generate a new treww", 10, height-10);

  stroke(0);
  pushMatrix();
  // Start the tree from the bottom of the screen
  translate(width/2, height);
  // Start the recursive branching!
  branch(120);
  popMatrix();
}

void branch(float h) {
  // thickness of the branch is mapped to its length
  float sw = map(h, 2, 120, 1, 5);
  strokeWeight(sw);
  // Draw the actual branch
  line(0, 0, 0, -h);
  // Move along to end
  translate(0, -h);

  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66f;

  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    // A random number of branches
    int n = int(random(1, 4));
    for (int i = 0; i < n; i++) {
      // Picking a random angle
      float theta = random(-PI/2, PI/2);
      pushMatrix();      // Save the current state of transformation (i.e. where are we now)
      rotate(theta);     // Rotate by theta
      branch(h);         // Create a branch again
      popMatrix();       // Whenever we get back here, we "pop" in order to restore the previous matrix state
    }
  }
}
