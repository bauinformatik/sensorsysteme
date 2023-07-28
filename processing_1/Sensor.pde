class Sensor {
   final int id;
   Point location;
   Measure last;

   Sensor(int id, Point location){
     this.id = id; 
     this.location = location;
   }
   
   void drawFloor(color c){
     if(last != null){
       fill(c);
       circle(location.x, location.y, last.value/5);
     }
   }

   void printValues(){
     print("Sensor "+id+": ");
     if(last != null){
         println(last.value);
     } else {
         println("null");
     }
   }
}
