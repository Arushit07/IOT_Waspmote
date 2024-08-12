#include "WaspHash.h"
 
char message[] = "Waspmote";
uint8_t hash_message_sha1[20]; 
 
 
void setup()
{
  USB.ON();
  USB.println(F("SHA example"));
  USB.println(F("SHA-1 algorithm"));
  USB.println(F("Message Digest length of 160 bits (20 Bytes)"));
  USB.println();
  
  USB.print(F("Original message: "));
  USB.println(message);

}

void loop()
{    
  HASH.sha( SHA1, hash_message_sha1, (uint8_t*)message, strlen(message)*8); 
  HASH.printMessageDigest("SHA-1:", hash_message_sha1 , 20); 

  delay(5000);
}
