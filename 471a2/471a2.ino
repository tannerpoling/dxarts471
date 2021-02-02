int lightPin = A0;
int lightVal = 0;
int lightMin = 720;
int lightMax = 850;

int vibePin = 9;
int vibeVal = 0;
int vibeMin = 0;
int vibeMax = 220;

int thermPin = A5;
int thermVal = 0;
int thermMin = 0;
int thermMax = 1024;

int speaker = 11;
int toneVal = 0;
int toneMin = 0;
int toneMax = 400;

void setup() {
  
  Serial.begin(9600);
  pinMode(vibePin, OUTPUT);
  pinMode(speaker, OUTPUT);
  
}

void loop() {
  lightVal = analogRead(lightPin);
  thermVal = analogRead(thermPin);
  
  if (lightVal < lightMin) {
    lightVal = lightMin;
  } else if (lightVal > lightMax) {
    lightVal = lightMax;
  }

  if (thermVal < thermMin) {
    thermVal = thermMin;
  } else if (thermVal > thermMax) {
    thermVal = thermMax;
  }
  
  vibeVal = map(lightVal, lightMin, lightMax, vibeMin, vibeMax);

  toneVal = map(thermVal, thermMin, thermMax, toneMin, toneMax);
  tone(speaker, toneVal);

  analogWrite(vibePin, vibeVal);
  
//  digitalWrite(vibePin, HIGH);
//  delay(50000);
//  digitalWrite(vibePin, LOW);
//  delay(500);
  Serial.print("light = ");
  Serial.print(lightVal);
  Serial.print("\t vibeVal = ");
  Serial.println(vibeVal);

  Serial.print("therm = ");
  Serial.print(thermVal);
  Serial.print("\t toneVal = ");
  Serial.print(toneVal);
}
