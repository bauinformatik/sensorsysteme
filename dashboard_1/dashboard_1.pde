import processing.serial.*;

Serial serial = new Serial(this, "/dev/ttyUSB0", 9600);
Sensor sensor1 = new Sensor(1, new Point(50,50,0));
Sensor sensor2 = new Sensor(2, new Point(450,200,0));

void setup(){
  surface.setLocation(0,0);
  size(500,810);
  serial.buffer(4);
}

void draw(){
    background(200);
    drawFloor();
    sensor1.printValues();
    sensor2.printValues();
    sensor1.drawFloor(color(0,0,255));
    sensor2.drawFloor(color(255,0,0));
    noLoop();
}

void serialEvent(Serial serial){
    // TODO read sensor ID, time
    sensor1.last = new Measure(millis(), srl.read()*256 + srl.read());
    sensor2.last = new Measure(millis(), srl.read()*256 + srl.read());
    redraw();
}

void drawFloor(){
  fill(255);
  stroke(0);
  rect(25,25,450,200);
  line(300,25,300,225);
  line(240,25,240,225);
  line(300,100,475,100);
  rect(25,250,450,255);
  rect(25,530,450,255);
}
