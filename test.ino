void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  // read the input on analog pin 0:
  float R = 680;
  
  // R1, R2, R3
  float sensorValue0 = analogRead(A0);
  float voltage0 = sensorValue0 * (5.0 / 1023.0);
  float Rtotal = 0;
  Rtotal = voltage0*R/(5-voltage0);

  //R1
  float sensorValue4 = analogRead(A3);
  float voltage4 = sensorValue4 * (5.0/1023.0);
  float R1 = 0;
  R1 = voltage4*(Rtotal+R)/5.0;

  //R2 
  float sensorValue3 = analogRead(A2);
  float voltage3 = sensorValue3 * (5.0/1023.0);
  float R2 = 0;
  R2= voltage3*(Rtotal+R)/5.0;
  R2 = R2 - R1;

  //R3 
  float sensorValue2 = analogRead(A1);
  float voltage2 = sensorValue2 * (5.0/1023.0);
  float R3 = 0;
  R3 = voltage2*(Rtotal+R)/5.0;
  R3 = R3 - R1 - R2;

  float R4 = 0;
  R4 = Rtotal - R1 - R2 - R3;

  
  Serial.println(R1);
  delay(500);
  Serial.println(R2);
  delay(500);
  Serial.println(R3);
  delay(500);
  Serial.println(R4);
  delay(500);
  Serial.println(Rtotal);
  delay(500);
}
