public class FireworksDisplay {
  ArrayList<TimedFirework> fireworks;
  long startTimeMs = 0;
  
  public FireworksDisplay(){
    fireworks = new ArrayList<TimedFirework>();
  }
  
  public void addFirework( Firework f, float launchTimeMs ) {
    fireworks.add( new TimedFirework( f, launchTimeMs ) );
  }
  
  public void launch(){
    if( startTimeMs == 0 ){
      startTimeMs = millis();
    }

    for( int i = fireworks.size() - 1; i >= 0; i-- ){
      TimedFirework timedFirework = fireworks.get(i);
      
      if( ! timedFirework.hasLaunched ) {
        // Haven't launched before
        println("not launched");
        if( getDurationMs() >= timedFirework.launchTimeMs ){
          // Time to launch
          println("over time");
          timedFirework.firework.draw();
          
          if( ! timedFirework.isActive() ){
             fireworks.remove( i ); 
          }
        }
      }
    }
  }
  
  private float getDurationMs(){
     if( startTimeMs == 0 ){
       return 0;
     }
     
     return( millis() - startTimeMs );
  }
  
  class TimedFirework {
    Firework firework;
    Float launchTimeMs = null;
    Boolean hasLaunched = null;
    
    public TimedFirework( Firework f, float launchTimeMs ){
      this.firework = f;
      this.launchTimeMs = launchTimeMs;
      this.hasLaunched = false;
    }
    
    public boolean isActive(){
      return firework.particles.size() > 0;
    }
  }
}
