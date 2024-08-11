#include <WaspXBee802.h>


void setup()
{
  USB.ON();
  xbee802.ON();
  
  
  
  xbee802.getOwnMacLow(); // Get 32 lower bits of MAC Address
  xbee802.getOwnMacHigh(); // Get 32 upper bits of MAC Address

  uint8_t higher_add1 = xbee802.sourceMacHigh[0];
  uint8_t higher_add2 = xbee802.sourceMacHigh[1];
  uint8_t higher_add3 = xbee802.sourceMacHigh[2];
  uint8_t higher_add4 = xbee802.sourceMacHigh[3];// stores the 32 upper bits of MAC address
  uint8_t lower_add1 = xbee802.sourceMacLow [0]; 
  uint8_t lower_add2 = xbee802.sourceMacLow [1];
  uint8_t lower_add3 = xbee802.sourceMacLow [2];
  uint8_t lower_add4 = xbee802.sourceMacLow [3];
  //xbee802.setChannel(0x0D);
  xbee802.getChannel(); 
  
  
  USB.printHex(higher_add1);
  USB.printHex(higher_add2);
  USB.printHex(higher_add3);
  USB.printHex(higher_add4);
  USB.printHex(lower_add1);
  USB.printHex(lower_add2);
  USB.printHex(lower_add3);
  USB.printHex(lower_add4);
  USB.println(F(""));
  USB.print(F("Channel is:"));
  USB.print(F("0x"));
  USB.println(xbee802.channel,HEX);
  
  
}

void loop()
{
  // put your main code here, to run repeatedly:
}

