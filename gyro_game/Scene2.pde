/* For Second scene */

void Scene2() {
  translate(-worldCamera.pos.x, -worldCamera.pos.y);
  worldCamera.draw();
  background(0, 200, 0);
  
  rectMode(CENTER);
  fill(0);
  rect(width/2, 400, 400, 600000);
  
  fill(255, 255, 255);
  for (stripeX = 60; stripeX < 602000; stripeX +=120) {
    rect(width/2, stripeX, 20, 70);
  }
  for(int i = 54000; i >= 1000; i -= 2000) {
    fill(55);
    rect(880, i, 100, 200);
  }
  for(int i = 54000; i >= 1000; i -= 2000) {
    fill(55);
    rect(1050, i+1000, 100, 200);
  }
  carY = map(val2, -50, 50, 660, 1300); // Mapping the value coming from the GY-61 Gyroscope sensor, to adjust it according to the Game window layout.
  image(img, carY, carX, 64, 164);
  println(score);
  textSize(32);
  text("Score: "+score, 50, carX); 
  
  if (carX <= 600) {
    speed = 0;
    carX = 600;
    delay(3000);
    mp = 3;
  }
  carX -= speed;
  if(carY < 760 || carY > 1140) {
    speed = 5;
    score -= 3;
  }
  else {
    speed = 20;  
    score++;
  }
  rectMode(CENTER);
  fill(55);
  if(carX < 54000 && carX % 2000 >= 1800 && carX % 2000 <= 1998 && carY >= 780 && carY <= 930) {
      speed = 3;
      score -= 5;
  }
  if(carX < 54000 && carX % 2000 >= 900 && carX % 2000 <= 1100 && carY >= 950 && carY <= 1150) {
      speed = 3;
      score -= 5;
  }
}
