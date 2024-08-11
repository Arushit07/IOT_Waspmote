#include <WaspLoRaWAN.h>

// Define DEVICE-EUI, APP-EUI, and APP-Key
char DEVICE_EUI[8] = "1122334455667788";
char APP_EUI[8] = "1122334455667788";
char APP_KEY[16] = "11223344556677881122334455667788";

// Data to send
uint8_t data[4] = { 0x01, 0x02, 0x03, 0x04 };

void setup() {
  // Initialize Serial for debugging
  USB.ON();
  USB.println(F("LoRaWAN example"));

  // Initialize LoRaWAN module
  LoRaWAN.ON(SOCKET0);

  // Configure LoRaWAN parameters
  LoRaWAN.setDeviceEUI(DEVICE_EUI);
  LoRaWAN.setAppEUI(APP_EUI);
  LoRaWAN.setAppKey(APP_KEY);

  // Join the network
  if (LoRaWAN.joinOTAA() == 0) {
    USB.println(F("Joined LoRaWAN network successfully"));
  } else {
    USB.println(F("Failed to join LoRaWAN network"));
  }
}

void loop() {
  // Send data
  if (LoRaWAN.sendConfirmed(data, sizeof(data), 1) == 0) {
    USB.println(F("Data sent successfully"));
  } else {
    USB.println(F("Failed to send data"));
  }

  // Wait for a minute before sending next data
  delay(60000);
}

