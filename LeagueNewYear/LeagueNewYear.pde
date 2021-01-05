Countdown countdown;
FireworksDisplay fireworksDisplay;
Firework firework;
int x = 0;
int y = 0;

// 1. Declare a PImage variable for the background. Don't initialize it!
PImage bg;
void setup() {
  // 2. Set the size of the sketch to at least width=1200 and height=800
  size(1200, 800);
  // 3. Set your PImage variable to the output of the
  //    loadImage() method with one of the 3 inputs:
  //    "sanDiego.jpg", "futureCity.jpg", "space.jpg"
  bg = loadImage("sanDiego.jpg");
  // 4. Call your PImage's resize() method with your width and height
bg.resize(1200, 800);
  
  // 5. Set the firework variable to a new Firework(x, y)
  //    Where x and y are coordinates within the display
firework = new Firework(900, 100);
}

void draw() {
  // 6. Call the image() method with x = 0 and y = 0 to display your background image
  image(bg, x, y);
  // 7. Call tint(255, 50)
  tint(255, 50);
  // 8. Call the firework's draw() method
  firework.draw();
  // 9. Run the program.
  //    Do you see the firework?
  //yes
  // 10. Set the firework variable to a new firework when the mouse is
  //     pressed (mousePressed) and use mouseX and mouseY for the x and y
  //     input parameters
  if(mousePressed){
    firework = new Firework(mouseX, mouseY);
  }

  
  
  // EXTRA
  // Can you figure out how to:
  // * Make the fireworks sparkle?
  // * Make a multi-colored firework?
  // * Set the size of your firework?
  
  firework.setSparkle(true);
  firework.setMultiColoredFirework();
  firework.setFireworkSize(1, 10);
  
  
  
  
  
  
  
  
  
  
  
  
  // SUPER SECRET EXTRA
  // 1. Let's set up a fireworks display! Copy the following code at the end of the 
  // setup() method:
  //   fireworksDisplay = new FireworksDisplay();
  //
  //   for( int i = 0; i < 10; i++ ){
  //     int[] fireworkColors = { #FF0000, #00FF00, #0000FF, #FFFF00, #FF00FF, #00FFFF };
  //     Firework newFirework = new Firework(random(width), random(height), fireworkColors[i % fireworkColors.length]);
  //     fireworksDisplay.addFirework(newFirework, i*1000);
  //   }
  //   for(int k = 0; k < 30; k++){
  //     int[] fireworkColors = { #FF0000, #FFFFFF, #0000FF };
  //     Firework newFirework = new Firework(random(width), random(height), fireworkColors);
  //     fireworksDisplay.addFirework(newFirework, (100*k) + 10000);
  //   }
  //
  // 2. Create a Countdown object in the setup() method with a starting value of 10. This will create a
  // timer that counts down from 10 to 0.
  //
  // 3. Call the fireworksDisplay's launch() method and the Countdown object's draw() method.
  // How do the fireworks look? See if you can modify some of the code to make your
  // own unique New Year's fireworks celebration!

}
