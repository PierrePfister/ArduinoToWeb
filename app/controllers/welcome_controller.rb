# -*- coding: utf-8 -*-
require 'lazy_high_charts'



class WelcomeController < ApplicationController

  def index

                
    # The code for the thread which would handle the reading of the Arduino
    # serial and store it to the db
    readAndStore = lambda {
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
      
    } # lambda

   # Launch a thread to perform the reading of the Arduino board 
   # The thread will be killed when the main process will be killed
   readThread = Thread.new &readAndStore
   @temperatures = Temperature.all

   @chart = LazyHighCharts::HighChart.new('graph') do |f|
       f.title({ :text=>"Temperature sensed by the Arduino Board today"})
       f.options[:xAxis][:categories] = ['h11','h12','h13',]
       f.labels(:items=>[:html=>"in Celsius", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
       f.series(:type=> 'column',:name=> 'living room',:data=> [3,2,1,3,4,2,3,7,9,10,1,23,3,34,27,30,34,23,23,24,25,23,23,23,24,2,2])
    end
    
    respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @temperatures }
     end
  
   end #index

   session[:test] = "PP is the best"
  puts "------------------------------------------- #{session[:test]}"

   

end # WelcomeController class

