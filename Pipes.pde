public class Pipe {
  
  private float width;
  private float x;
  private float y1;
  private float y2;
  
  public Pipe(float x, float y1, float y2, float width) {
    this.x = x;
    this.y1 = y1;
    this.y2 = y2;
    this.width = width;
  }
  
  
  // Creates the pipe on the screen as two rectangles, one starting from the top of the screen, and one starting from the bottom of the screen. 
  public void draw() {
    fill(255, 255, 255);
    rect(x, 0, width, y1);
    rect(x, windowHeight - y2, width, y2);
   
  }
  
  public void update() {
    x -= gameSpeed;
  }
  
  public float getX() {
    return x;
  }
  
  public float getClearanceHeight() {
    return windowHeight - y1 - y2;
  }
  
  public float getClearanceY() {
    return y1;
  }
  
}