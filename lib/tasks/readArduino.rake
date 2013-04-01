desc "Read the Arduino board on USB and store the value"

task :readArduino => :environment do puts "Read and Store Arduino"

  # The code for the thread which would handle the reading of the Arduino 
  # serial and store it to the db 

  require 'rubygems' 
  require 'serialport'

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

  temperatureString =""

  # Get the temperature one by one
  loop do 
  char = sp.getc
    if (char==",") # temperature is read, we got the next ,
      if (temperatureString <=> "")
        oneTemp = Temperature.new(:sensorTemp => temperatureString.to_f)
        oneTemp.save
        puts "temperature created #{oneTemp.sensorTemp}"  
        temperatureString = ""
      end # if
      else
        temperatureString << char # append the cha just read to the temperature string
      end #if
    end #loop
    
end

