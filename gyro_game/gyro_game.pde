/*
*** READ BEFORE USING THIS CODE***
Do not repost without giving credits. The given code is fully open source, but makle sure to give credits whenever you're using, even a piece of this code.
Do not use this code for commercial purposes. According to my licensing, you'll have to lend out at least 50% of the equity in the name of Neel Adwani, the Co-Founder of STEAM Attic.
Take a look at the comments if you have any doubts in understanding the code and it should be used for educational purposes only.
I won't be responsible for any body misusing this code except myself.
*/

import processing.serial.*;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
float val2 = 0;
PImage img;
PImage bg;
PImage grass;
float carX;
float carY;
float speed;
float stripeX;
float score;
int currentScene;
int mp;
Camera worldCamera; // Defining an object of Class Camera.
void setup() {
  size(1920, 1080);
  img = loadImage("sprite6.png"); // Loading the image of the car.
  carX = 60600; // Initial position of the car
  speed = 0.1; // Initial Speed of the car
  stripeX = 10; // Initial position of the road stripe
  worldCamera = new Camera(); // Creating a new object named worldCamera of class Camera
  score = 0; // Initial score
  bg = loadImage("bg3.jpg"); // Loading the background for scene 1
  grass = loadImage("grass2.jpg"); // Background image for scene 2
  carY = height/2; // Initial position of car on the Y axis
  mp = 1; // Defining the initial scene
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600); // To find out the existing port of the arduino and establishing communication between arduino and Processing
}
void draw() {
  
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n');
  String val3 = "";
  if(val != null) {
  val3 = val.replaceAll("[^\\d.-]", ""); // To replace all the random unwanted characters with nothing, coming from the connected port.
  }
  if(val3 == null || val3 == "") {
    val2 = 0; 
    val3 = "0";
    val = "0";
  }
  // read it and store it in val
  val2 = Float.parseFloat(val3);
  
  println(val);
  } 
 //print it out in the console
  switch(mp) {
    /*
      Using these cases to switch between the scenes
    */
  case 1: 
    Scene1(); // This one's the intro scene
    break;
  case 2: 
    Scene2(); // This one's for the main game.
    break;
  case 3: 
    Scene3(); // This one's for last score display
    break;
  default: 
    Scene1();
  }
}
void mousePressed() {
  switch(mp) {
  case 1: 
    mp = 2;
    break;
  case 3:
    System.exit(0);
    break;
  }
}
