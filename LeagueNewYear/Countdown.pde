public class Countdown {
  long startTimeMs;
  PFont font;
  int startingValueSec;
  
  public Countdown(int startingValueSec) {
    this.startingValueSec = startingValueSec;
    font = loadFont("GillSans-UltraBold-100.vlw");
    startTimeMs = millis();
  }
  
  public void draw(){
    textFont(font);
    
    long elapsedTimeSec = ( millis() - startTimeMs ) / 1000;
    if( elapsedTimeSec > this.startingValueSec ){
      text("Happy New Year!", width/2 - 550, height/2);
    } else {
      text(int(this.startingValueSec - elapsedTimeSec), width/2 - 100, height/2);
    }
  }
}
