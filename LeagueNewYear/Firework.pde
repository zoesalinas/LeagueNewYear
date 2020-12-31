public class Firework {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  int numParticlesPerFirework = 75;
  
  // Add default white firework
  public Firework( float x, float y ) {
    int fireworkColor = #FFFFFF;
    setup( x, y, new int[]{ fireworkColor } );
  }

  // Add custom color firework
  public Firework( float x, float y, int fireworkColor ) {
    setup( x, y, new int[]{ fireworkColor } );
  }
  
  // Add a multi-colored firework
  public Firework( float x, float y, int[] fireworkColors ) {
    setup( x, y, fireworkColors );
  }
  
  public void setup( float x, float y, int[] fireworkColors ) {
    for (int i = 0; i < numParticlesPerFirework; i++) {
      Particle p = new Particle( x, y, fireworkColors[ i % fireworkColors.length ] );
      particles.add( p );
    }
  }
  
  // Set random colored firework
  public void setMultiColoredFirework() {
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).fireworkColor = getRandomColor();
    }
  }
  
  public void setFireworkSize( float minSize, float maxSize ){
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).size = random( minSize, maxSize );
    }
  }
  
  public void setSparkle( boolean setting ){
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).isSparkle = setting;
    } 
  }
  
  public int getRandomColor(){
    return color(random(255), random(255), random(255));
  }
  
  public void draw() {    
    for( Particle p : particles ) {
      p.update();
      p.draw();
    }
    
    purge();
  }

  private void purge() {
    for (int i = 0; i <particles.size(); i ++) {
      if( particles.get(i).newY > height){
        particles.remove(i);
      }
    }
  }

  class Particle {
    float newX;
    float oldX;
    float newY;
    float oldY;
    float dir;
    float magnitude;
    float xVelocity;
    float yVelocity;
    float size;
    float gravity;
    int fireworkColor;
    boolean isSparkle = false;

    public Particle(float x, float y) {
      setup(x, y);
    }

    public Particle( float x, float y, int fireworkColor ) {
      setup(x, y);
      this.fireworkColor = fireworkColor;
    }
    
    public Particle( float x, float y,  int fireworkColor, float minSize, float maxSize ) {
      setup(x, y);
      this.fireworkColor = fireworkColor;
      this.size = random(minSize, maxSize);
    }

    void setup(float x, float y) {
      newX = x;
      oldX = newX;
      newY = y;
      oldY = newY;
      
      // radiate particles 360 degree from center
      dir = random(0, TWO_PI);
      
      // Blast radius so the particle falls within the screen width
      float fireworkWidth = float(width) / (1.7 * width);
      magnitude = fireworkWidth * random(10.1, 25);
      xVelocity = magnitude * cos(dir);
      yVelocity = magnitude * sin(dir);
      
      
      size = random(1, 10);
      gravity = 0.2;
      fireworkColor = #FFFFFF;
    }

    void draw() {
      push();
      
      // Draw a line from the old location to the new location
      strokeWeight(this.size);
      if( isSparkle ){
        float red = red(this.fireworkColor) - random(50);
        float green = green(this.fireworkColor) - random(50);
        float blue = blue(this.fireworkColor) - random(50);
        stroke(red, green, blue, random(255));
      } else {
        stroke(this.fireworkColor);
      }
      line(oldX, oldY, newX, newY);
      
      pop();
    }

    void update() {
      // Calculate new X and Y, set old X and Y
      oldX = newX;
      oldY = newY;
      newX += xVelocity;
      newY += yVelocity;
      yVelocity += gravity;
    }
  }
}
