#include "WaspHash.h"

// Original message
char message[] = "Waspmote";

// Variable to store the hash message
uint8_t hash_message_md5[16];
  
  
void setup()
{
  USB.ON();
  USB.println(F("HASH_01 example"));
  USB.println();
}


void loop()
{   

  USB.print(F("Original message: "));
  USB.println(message);
  
  // Calculate hash of original message with MD5 Algorithm  
  HASH.md5( hash_message_md5, (uint8_t*)message, strlen(message)*8); 
 
  // Printing message digest MD5  
  USB.println(F("The message digest created: "));
  HASH.printMessageDigest("MD5:", hash_message_md5 , 16); 

  delay(5000);
}
