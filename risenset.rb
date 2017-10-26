require 'open-uri'
require 'json'
require 'dotenv'

Dotenv.load


def reverse_geo(address)
  geokey = ENV['API_KEY']
  url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{geokey}"
  output = JSON.parse(open(url).read)
  latitude = output['results'][0]['geometry']['location']['lat']
  longitude = output['results'][0]['geometry']['location']['lng']
  sunrise_sunset(latitude, longitude)
end

def sunrise_sunset(lat, lng)
  url = "https://api.sunrise-sunset.org/json?lat=#{lat}&lng=#{lng}&callback=mycallback"
  output = open(url).read
  puts output.mycallback
end

def main
  puts 'input your location'
  address = gets.chomp
  reverse_geo(address)
end

# main
