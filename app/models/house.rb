class House
  include Mongoid::Document
  include Mongoid::Spacial::Document
  include Mongoid::Timestamps

  field :address, type: String
  field :info, type: String
  field :geo, type: Array, spacial: true
  field :area, type: String
  field :price, type: String
  field :tenant, type: String
  field :internet, type: String
  field :other, type: String
  field :stt, type: String
  field :contact, type: String

  attr_accessor :geo_lat, :geo_lng
  attr_accessible :info, :address, :geo, :area, :price, :tenant, :internet, 
                  :other, :stt, :contact

  # after_save :get_geo, if: "geo[:lat].blank?"

  def get_lat
    geo[:lat] || "21.0333333"
  end

  def get_lng
    geo[:lng] || "105.85"
  end

  # def get_geo
  #   s = Geocoder.search(address)
  #   geo = {:lat=>s[0].latitude.to_s,:lng=>s[0].longitude.to_s}
  #   save
  # end
end

