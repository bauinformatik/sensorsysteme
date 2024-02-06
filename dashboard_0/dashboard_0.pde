import processing.serial.*;

Serial serial = new Serial(this, "/dev/ttyUSB1", 9600);
Sensor sensor1 = new Sensor(1);
Sensor sensor2 = new Sensor(2);

void setup(){
  surface.setLocation(0,0);
  size(500,810);
  // findStopBytes();
  serial.buffer(6);
}

void findStopBytes(){
  serial.readBytesUntil(0);
  if(!(serial.read()==0 && serial.read()==0 )){
    findStopBytes();
  }
}

void draw(){
    background(200);
    drawDashboard();
    sensor1.printValues();
    sensor2.printValues();
    noLoop();
}

void serialEvent(Serial srl){
      // TODO read time
    srl.read(); // sensor ID
    sensor1.last = new Measure(millis(), srl.read()*256 + srl.read());
    srl.read(); // sensor ID
    sensor2.last = new Measure(millis(), srl.read()*256 + srl.read());
    redraw();
}

void drawDashboard(){
  fill(255);
  stroke(0);
  rect(25,25,450,200);
  rect(25,250,450,255);
  rect(25,530,450,255);
}
