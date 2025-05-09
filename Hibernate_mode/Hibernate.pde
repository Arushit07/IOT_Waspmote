
#include <WaspRTC.h>        // Include the RTC library

void setup() {
  USB.ON();
  RTC.ON();
  //RTC.setTime("24:06:21:06:23:59:50");
  //RTC.setAlarm1("00:00:00:10",RTC_OFFSET,RTC_ALM1_MODE5); 
 

}

void loop() {
  
  if( intFlag & HIB_INT )
  {
    
    hibInterrupt();
  }
  PWR.hibernate("00:00:00:10",RTC_OFFSET,RTC_ALM1_MODE5);  //wakes up after every 10secs only if hibernate interrupt
  
}

void hibInterrupt()
{
  

  
  USB.println(F("Woke up from hibernation"));

  USB.print(F("Current Time: "));
  USB.println(RTC.getTime());
  intFlag &= ~(HIB_INT);

  USB.OFF();
    
  delay(5000);
}
