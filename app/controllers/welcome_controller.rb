# -*- coding: utf-8 -*-

class WelcomeController < ApplicationController

  def index

    readAndStore = lambda { 
      loop do 
        puts "Alive !" 
        sleep 1
      end
    }

#   load "readArduino.rb"
    readThread = Thread.new &readAndStore

  end

end

