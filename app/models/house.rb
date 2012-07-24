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

  accepts_nested_attributes_for :item_images, :allow_destroy => true

  attr_accessor :geo_lat, :geo_lng
  attr_accessible :info, :address, :geo, :area, :price, :tenant, :internet, 
                  :other, :stt, :contact

  # has_many :images, autosave: true

  def get_lat
    geo[:lat] || "21.0333333"
  end

  def get_lng
    geo[:lng] || "105.85"
  end

  def image_url(size = "200x200")
    item_images.first.try(:image_url, size)
  end
end

