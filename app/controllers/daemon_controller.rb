# -*- coding: utf-8 -*-

require 'rubygems'
require 'daemons'

class DaemonController < ApplicationController
  def index

    options = {
      :app_name => "collectTemperature",
      :multiple => true
    }

    taskread = Daemons.call do      
      loop {sleep 10}
    end

    
  
  end # def
end # class
