
const int pinLED = 13;

void setup() 
{
   Serial.begin(9600);
   pinMode(pinLED, OUTPUT);
}

void loop()
{
    while (!Serial.available());
   
    char option = Serial.read();
    if (option == '1')
    {
        digitalWrite(pinLED, HIGH);
        Serial.print(option + 1);
        
    } else {
        
        digitalWrite(pinLED, LOW);
        Serial.print(option + 1);

    }
}