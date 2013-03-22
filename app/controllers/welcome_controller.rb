# -*- coding: utf-8 -*-

class WelcomeController < ApplicationController
  def index

    require "serialport"

    #params for serial port
    port_str = "/dev/tty.usbmodemfd131"  #the port used by the Arduino USB
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE

    #Create the serialPort
    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

    #Flush any buffered data 
    sp.flush

    render :text  =>  "<h1>"+sp.gets+"</h1>"
  end
end

