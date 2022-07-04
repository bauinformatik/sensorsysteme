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
   
   double average(){
     int sum = 0, n = 0;
     for (Measure m: last){
       if(m!=null){
         n++;
         sum += m.value;
       }
     }
     return n > 0 ? (double)sum/n : -1;
   }
   
   double deviation(){
     int sum = 0, n = 0;
     double average = average();
     for (Measure m: last){
       if(m!=null){
         n++;
         sum += Math.pow(m.value - average, 2);
       }
     }
     return n > 0 ? Math.sqrt((double)sum/n) : -1;
   }
   
   double maximum(){
     double result = Double.MIN_VALUE;
     for (Measure m: last){
       if(m!=null){
         result = Math.max(result, m.value);
       }
     }
     return result;
   }
   
   double minimum(){
     double result = Double.MAX_VALUE;
     for (Measure m: last){
       if(m!=null){
         result = Math.min(result, m.value);
       }
     }
     return result;
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
