const int buttonAPin = 2;
const int buttonBPin = 3;

int buttonAState = HIGH;
int buttonBState = HIGH;
int lastButtonAState = HIGH;
int lastButtonBState = HIGH;

void setup(){
   Serial.begin(9600);
   pinMode(buttonAPin, INPUT_PULLUP);
   pinMode(buttonBPin, INPUT_PULLUP);  
}
void loop(){
  // TODO write time stamp
  Serial.write(0); Serial.write(0); Serial.write(0);
  Serial.write(2);
  analogRead(1); int val2 = analogRead(1);
  Serial.write(val2/256); Serial.write(val2%256);
  Serial.write(1);
  analogRead(0); int val1 = analogRead(0);
  Serial.write(val1/256); Serial.write(val1%256);

  // button read more often (every 10 ms previously) 
  buttonAState = digitalRead(buttonAPin);
  if((lastButtonAState == HIGH) && (buttonAState == LOW)){
      // Serial.println("A");
  }
  buttonBState = digitalRead(buttonBPin);
  if((lastButtonBState == HIGH) && (buttonBState == LOW)){
      // Serial.println("B");
  }
  lastButtonAState = buttonAState;
  lastButtonBState = buttonBState;
   
   delay(1000);

}
