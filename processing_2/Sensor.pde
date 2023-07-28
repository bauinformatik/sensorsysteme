class Sensor {
   final int id;
   Point location;
   LinkedList<Measure> last = new LinkedList<Measure>();

   Sensor(int id, Point location){
     this.id = id; 
     this.location = location;
     println(last.size());
     for( int i=0; i<19; i++ ){
       last.add(null);
     }
   }
   
   void drawFloor(color c){
     if(last.peekLast() != null){
       fill(c);
       circle(location.x, location.y, last.peekLast().value/5);
     }
   }
   void drawDiagram(color c){
     ListIterator<Measure> it = last.listIterator();
     Measure current = it.next();
     int time = 25;
     stroke(c);
     while(it.hasNext()){
       Measure next = it.next();
       if(current!=null && next != null){
         line(time, 505-current.value, time+25, 505-next.value);
       }
       current = next; time += 25;
     }
     stroke(0);
   }

   void printValues(){
     print("Sensor "+id+": ");
     for (Measure measure: last){
       if(measure!= null){
         print(measure.value + " ");
       } else {
         print("null ");
       }
     }
     println();
   }
}
