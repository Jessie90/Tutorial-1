import processing.serial.*;
import cc.arduino.*;
import eeml.*;
import pachuino.*;

Pachuino p;

void setup(){   
    p = new Pachuino(this, Arduino.list()[0], 57600);   
    p.manualUpdate("http://www.pachube.com/api/35134.xml"); // change URL -- this is the feed you want to update
    p.setKey("API Key");   

   
    // local sensors   
    p.addLocalSensor("analog", 0,"lightSensor");

}

void draw(){
  float tempWall = p.localSensor[0].value;
  println(tempWall);

    //p.debug();
}



// you don't need to change any of these

void onReceiveEEML(DataIn d){ 
    p.updateRemoteSensors(d);
}
