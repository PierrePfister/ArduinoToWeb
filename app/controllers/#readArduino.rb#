=begin
# The code for the thread which would handle the reading of the Arduino
# serial and store it to the db
require 'rubygems'
require 'daemons'
require 'serialport'
require 'csv'
=end

readAndStore = lambda { 
  loop do
    puts "Alive !"
    sleep 1
  end
}

=begin

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

  loop do 
    char = sp.getc
    if (char==",")
      puts temperature.to_f
#    Temperature.new(:sensorTemp => char)
      temperature = ""
    else
      temperature << char
  end

end

=end
