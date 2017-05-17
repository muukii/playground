require 'nokogiri'
require 'open-uri'

url = 'https://github.com/trending/swift'

html = open(url)

