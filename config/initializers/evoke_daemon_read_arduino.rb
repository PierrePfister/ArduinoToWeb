# Here is where the daemon starts 
# This daemon is reading the Arduino board through serial and store the data in the temperatures db
require 'rubygems'
require 'daemons'

readTask = Daemons.call do
  loop
  {
    #do nothing
  }
end
