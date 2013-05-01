class Rug
  RUGS = {
    drug: 'http://drug.org.pl/',
    krug: 'http://www.meetup.com/Krakow-Ruby-Users-Group/',
    lrug: 'http://lrug.pl/',
    prug: 'http://prug.pl/',
    srug: 'http://srug.pl/',
    wrug: 'http://wrug.eu/'
  }
  attr_accessor :name, :url

  class << self
    def all
      RUGS.map do |k,v|
        new.tap do |rug|
          rug.name = k.to_s
          rug.url = v
        end
      end
    end
  end
end
