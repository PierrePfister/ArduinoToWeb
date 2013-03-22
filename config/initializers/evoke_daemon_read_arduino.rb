# Here is where the daemon starts 
# This daemon is reading the Arduino board through serial and store the data in the temperatures db
require 'rubygems'
require 'daemons'
require 'serialport'
require 'csv'

# Parameter for setting up the serial port
port_str = "/dev/tty.usbmodemfd131" #USB port used by the Arduino board
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

# Create the serialPort 
sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)


# Read until you got a first "," in order to read complete values
begin
  char = sp.getc
end while (char != ",")
   
temperature =""

# get each temperature and store it in a string
# to be done
# define a slot as m minutes
# add a time and every minute get a new measurement, store it in a array of m slots
# when a slot is full, compute the average of a slot 
# store the slot value in the database
# when the welcome controller is called, look at the time and print out all the values
# stored in the database up to now
loop do 

  char = sp.getc
  if (char==",")
    puts temperature.to_f
    temperature = ""
  else
    temperature << char
  end

end

