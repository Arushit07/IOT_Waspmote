#include <WaspXBee802.h>

// PAN (Personal Area Network) Identifier
uint8_t  panID[2] = {0x32,0x34}; 

// Define Freq Channel to be set: 
// Center Frequency = 2.405 + (CH - 11d) * 5 MHz
//   Range: 0x0B - 0x1A (XBee)
//   Range: 0x0C - 0x17 (XBee-PRO)
uint8_t  channel = 0x0F;

// Define the Encryption mode: 1 (enabled) or 0 (disabled)
uint8_t encryptionMode = 0;

// Define the AES 16-byte Encryption Key
char  encryptionKey[] = "WaspmoteLinkKey!"; 


void setup()
{
  // open USB port
  USB.ON();

  USB.println(F("-------------------------------"));
  USB.println(F("Configure XBee 802.15.4"));
  USB.println(F("-------------------------------"));

  // init XBee 
  xbee802.ON();


  /////////////////////////////////////
  // 1. set channel 
  /////////////////////////////////////
  xbee802.setChannel( channel );

  // check at commmand execution flag
  if( xbee802.error_AT == 0 ) 
  {
    USB.print(F("1. Channel set OK to: 0x"));
    USB.printHex( xbee802.channel );
    USB.println();
  }
  else 
  {
    USB.println(F("1. Error calling 'setChannel()'"));
  }


  /////////////////////////////////////
  // 2. set PANID
  /////////////////////////////////////
  xbee802.setPAN( panID );

  // check the AT commmand execution flag
  if( xbee802.error_AT == 0 ) 
  {
    USB.print(F("2. PAN ID set OK to: 0x"));
    USB.printHex( xbee802.PAN_ID[0] ); 
    USB.printHex( xbee802.PAN_ID[1] ); 
    USB.println();
  }
  else 
  {
    USB.println(F("2. Error calling 'setPAN()'"));  
  }

  /////////////////////////////////////
  // 3. set encryption mode (1:enable; 0:disable)
  /////////////////////////////////////
  xbee802.setOwnNetAddress(0x11,0x22);
  xbee802.setMacMode(3);
  xbee802.setEncryptionMode( encryptionMode );

  // check the AT commmand execution flag
  if( xbee802.error_AT == 0 ) 
  {
    USB.print(F("3. AES encryption configured (1:enabled; 0:disabled):"));
    USB.println( xbee802.encryptMode, DEC );
  }
  else 
  {
    USB.println(F("3. Error calling 'setEncryptionMode()'"));
  }

  /////////////////////////////////////
  // 4. set encryption key
  /////////////////////////////////////
  xbee802.setLinkKey( encryptionKey );

  // check the AT commmand execution flag
  if( xbee802.error_AT == 0 ) 
  {
    USB.println(F("4. AES encryption key set OK"));
  }
  else 
  {
    USB.println(F("4. Error calling 'setLinkKey()'")); 
  }

  /////////////////////////////////////
  // 5. write values to XBee module memory
  /////////////////////////////////////
  xbee802.writeValues();

  // check the AT commmand execution flag
  if( xbee802.error_AT == 0 ) 
  {
    USB.println(F("5. Changes stored OK"));
  }
  else 
  {
    USB.println(F("5. Error calling 'writeValues()'"));   
  }

  USB.println(F("-------------------------------")); 
  
}



void loop()
{

  /////////////////////////////////////
  // 1. get channel 
  /////////////////////////////////////
  xbee802.getChannel();
  USB.print(F("channel: "));
  USB.printHex(xbee802.channel);
  USB.println();

  /////////////////////////////////////
  // 2. get PANID
  /////////////////////////////////////
  xbee802.getPAN();
  USB.print(F("panid: "));
  USB.printHex(xbee802.PAN_ID[0]); 
  USB.printHex(xbee802.PAN_ID[1]); 
  USB.println(); 

  /////////////////////////////////////
  // 3. get encryption mode (1:enable; 0:disable)
  /////////////////////////////////////
  xbee802.getEncryptionMode();
  USB.print(F("encryption mode: "));
  USB.printHex(xbee802.encryptMode);
  USB.println(); 

  USB.println(F("-------------------------------")); 

  delay(3000);
}
