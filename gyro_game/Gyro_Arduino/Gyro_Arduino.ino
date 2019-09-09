/*
 * I've used the GY-61 analog Gyroscope sensor with an Arduino Nano
 */

#include <math.h>
const int x_out = A1; /* connect x_out of module to A1 of UNO board */

void setup() {
  Serial.begin(9600); 
}

void loop() {
  delay(70);
  int x_adc_value; 
  double x_g_value;
  x_adc_value = map(analogRead(x_out), 355, 405, 0, 50); /* Digital value of voltage on x_out pin */ 
  Serial.println(x_adc_value);
  x_g_value = ( ( ( (double)(x_adc_value * 5)/1024) - 1.65 ) / 0.330 ); /* Acceleration in x-direction in g units */ 
}
