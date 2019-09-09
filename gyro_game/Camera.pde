/*
Creating this class to move the camera along with the car
*/

class Camera {
  PVector pos;

  Camera() {
    pos = new PVector(0, 60000);
  }

  void draw() {
    pos.y -= speed;
    if (pos.x > 59500) {
      pos.x = 59500;
    }
    if (pos.y < 600) {
      pos.y = 600;
    }
  }
}
