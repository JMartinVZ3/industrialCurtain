from flask import Flask
import serial

app = Flask(__name__)

arduino = serial.Serial("COM3", 9600)

@app.route('/on')
def turnOnLed():
    arduino.write(bytes("1", 'utf-8'))
    return 'Led is now On'

@app.route('/off')
def turnOffLed():
    arduino.write(bytes("0", 'utf-8'))
    return 'Led is now Off'
