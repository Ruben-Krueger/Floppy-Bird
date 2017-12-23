/* Floppy Bird, the Game
* By Ruben Krueger
*
* This is a version of "Flappy Bird." In the game, the player uses the space bar to 
* cause the bird (a white circle) to jump up. The bird must avoid hitting pipes, which
* are two rectangles, one extending from the top of the screen and one from the bottom.
* If the bird hits the pipe or falls below the bottom of the screen, the game is over. 
* The player gets a point for every pipe sucessfully cleared. 
*/


// game constants

// canvas color
private int background = 52;

// window size
private float windowWidth = 780;
private float windowHeight = 600;

// bird constants
private float birdX = 60;
private float birdRadius = 20;

// the constant pull on the bird to the bottom of the screen
private int gravity = 3;

// the amount that the bird will increase (in the Y-coordinate) when the player hits the space bar
private int jump = 60;

// the amount that the pipes move each second
private int gameSpeed = 4;

private int pipeWidth = 20;
private int maxPipeHeight = 300;
private int minPipeHeight = 30;

private int score = 0;
private int scoreVerticalOffset = 100;
private int scoreHorizontalOffset = 100;
private int gameOverMessageOffset = 100;

private Bird floppyBird = new Bird(birdX, windowWidth/ 2, birdRadius, gravity, jump);

private ArrayList<Pipe> pipeList = new ArrayList();

// Sets the width and height of the game window to 780 and 600, respectively.
void setup() {
  size(780, 600);
}

// Sets the background color, draws the bird, and pipes. Loops continuously while the game is being played. 
void draw() {
  background(background);
  floppyBird.draw();
  floppyBird.update();
  drawPipes();
  addPipes();
  checkIfPipeCollision();
  displayScore();
  if(floppyBird.getY() > windowHeight) {
      gameOver();
   }
}

// If the player pressed the spacebar, the bird will flop (jump).
void keyPressed() {
  if (key == ' ') {
    floppyBird.flop();
  }
}

// Prints a message to the screen if the game is over. Also, the method stops the draw() method, which stops all animation.
private void gameOver() {
  textSize(32);
  text("Game Over", windowWidth / 2 - gameOverMessageOffset, windowHeight / 2); 
  fill(250, 0, 0);
  noLoop();
}

// Checks if the bird hits a pipe. 
private boolean checkIfPipeCollision() {
  if(pipeList.size() == 0) return false;
  float pipeX = pipeList.get(0).getX();
  if(pipeX == birdX) {
    float clearanceHeight = pipeList.get(0).getClearanceHeight();
    float clearanceY = pipeList.get(0).getClearanceY();
    float birdY = floppyBird.getY();
    if(birdY > clearanceY && birdY + birdRadius < clearanceY + clearanceHeight) {
       score += 1;
    }
    else {
       gameOver();
    }
  }
  return false;
}

// Displays the score to the top right of the screen.
private void displayScore() {
  textSize(32);
  text(score, windowWidth - scoreHorizontalOffset, scoreVerticalOffset); 
  fill(250, 0, 0);
}

// Adds a new pipe every 50 frames. The pipe has a random length and is drawn at the far right of the screen.
private void addPipes() {
  if(frameCount % 50 == 0) {
    float y1 = random(minPipeHeight, maxPipeHeight);
    float y2 = random(minPipeHeight, maxPipeHeight);
    Pipe pipe = new Pipe(windowWidth, y1, y2, pipeWidth);
    pipeList.add(pipe);
  }
}

// Draws the pipes to the screen and moves them through the update() method. If the pipe is off the screen, the method will remove it.
private void drawPipes() {
  for(int i = 0; i < pipeList.size(); i++ ) {
    if(pipeList.get(i).getX() < 0) {
      pipeList.remove(i);
    }
    pipeList.get(i).draw();
    pipeList.get(i).update();
  }
}