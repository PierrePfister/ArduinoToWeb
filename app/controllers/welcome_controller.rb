# -*- coding: utf-8 -*-
require 'lazy_high_charts'



class WelcomeController < ApplicationController

  def index

    temperatureTab = []
    labelTab = []
    Temperature.find_each do |t| 
      temperatureTab << t.sensorTemp 
      labelTab << t.created_at
    end

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
       f.title({ :text=>"Temperature sensed by the Arduino Board today"})
       f.options[:xAxis][:categories] = labelTab
       f.labels(:items=>[:html=>"in Celsius", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
       f.series(:type=> 'column',:name=> 'living room',:data=> temperatureTab)
    end
    
    respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @temperatures }
     end
     
  
   end #index


   

end # WelcomeController class

