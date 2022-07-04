import processing.serial.*;
import java.util.LinkedList;
import java.util.ListIterator;

Serial serial = new Serial(this, "/dev/ttyUSB0", 9600);
Sensor sensor1 = new Sensor(1, new Point(50,50,0));
Sensor sensor2 = new Sensor(2, new Point(450,200,0));

void setup(){
  surface.setLocation(0,0);
  size(500,810);
  serial.buffer(2);
}

void draw(){
    background(200);
    drawFloor();  
    sensor1.printValues();
    sensor2.printValues();
    sensor1.drawFloor(color(0,0,255));
    sensor2.drawFloor(color(255,0,0));
    sensor1.drawDiagram(color(0,0,255));
    sensor2.drawDiagram(color(255,0,0));
    
    fill(color(0,0,255));
    text("Sensor 1", 150, 600);
    fill(color(255,0,0));
    text("Sensor 2", 300, 600);
    fill(0);
    text("Average: ", 50, 620);
    text("" + sensor1.average(), 150, 620);
    text("" + sensor2.average(), 300, 620);
    text("Minimum: ", 50, 640);
    text("" + sensor1.minimum(), 150, 640);
    text("" + sensor2.minimum(), 300, 640);
    text("Maximum: ", 50, 660);
    text("" + sensor1.maximum(), 150, 660);
    text("" + sensor2.maximum(), 300, 660);
    text("Deviation: ", 50, 680);
    text("" + sensor1.deviation(), 150, 680);
    text("" + sensor2.deviation(), 300, 680);

    noLoop();
}

void serialEvent(Serial serial){
    sensor1.last.poll();
    sensor1.last.add(new Measure(millis(), serial.read()));
    sensor2.last.poll();
    sensor2.last.add(new Measure(millis(), serial.read()));
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
