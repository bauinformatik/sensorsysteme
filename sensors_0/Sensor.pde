class Sensor {
   final int id;
   Measure last;

   Sensor(int id){
     this.id = id; 
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
