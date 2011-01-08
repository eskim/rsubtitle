$:.unshift File.dirname(__FILE__)

Dir["#{File.dirname(__FILE__)}/rsubtitle/*.rb"].each do |format|
  require "rsubtitle/#{File.basename format}"
end
