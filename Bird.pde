public class Bird {
  
  private float x;
  private float y;
  private float radius;
  private int gravity;
  private int jump;
  
  public Bird(float x, float y, float radius, int gravity, int jump) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.gravity = gravity;
    this.jump = jump;
  }
  
  public float getY() {
    return y;
  }
  
  public void update() {
    y += gravity;
  }
  
  // Causes the bird to jump up by decreasing its Y-coordinate.
  public void flop() {
    y -= jump;
  }
  
  // Creates the bird on the screen as a circle.
  public void draw() {
    fill(255,255,255);
    ellipse(x, y, radius, radius);
  }
  
  
}