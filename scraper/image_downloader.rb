require 'csv'
require 'open-uri'

BRANDS = [
  'rolex',
  'audemarspiguet',
  'breitling',
  'iwc',
  'jaegerlecoultre',
  'omega',
  'panerai',
  'patekphilippe',
  'cartier',
  'gucci',
  'seiko',
  'movado',
  'zenith'
]

BRANDS.each do |brand|

  data = CSV.read("/Users/fengsimon/Desktop/chrono-analyzer/scraper/data/#{brand}.txt")

  data.each_with_index do |item, index|
    open(item[0]) do |image|
      File.open("/Users/fengsimon/Desktop/chrono-analyzer/scraper/images/#{brand}-#{index+1}-#{item[1]}.jpg", "w+") do |file|
        file.write(image.read)
      end
    end
  end
end
