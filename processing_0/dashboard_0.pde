import processing.serial.*;

Serial serial = new Serial(this, "/dev/ttyUSB0", 9600);
Sensor sensor1 = new Sensor(1);
Sensor sensor2 = new Sensor(2);

void setup(){
  surface.setLocation(0,0);
  size(500,810);
  serial.buffer(2);
}

void draw(){
    background(200);
    drawDashboard();
    sensor1.printValues();
    sensor2.printValues();
    noLoop();
}

void serialEvent(Serial srl){
    sensor1.last = new Measure(millis(), srl.read());
    sensor2.last = new Measure(millis(), srl.read());
    redraw();
}

void drawDashboard(){
  fill(255);
  stroke(0);
  rect(25,25,450,200);
  rect(25,250,450,255);
  rect(25,530,450,255);
}
