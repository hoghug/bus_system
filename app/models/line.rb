class Line < ActiveRecord::Base
  has_many :stations, :through => :stops
  has_many :stops
  has_many :buses
  has_many :arrivals, :through => :buses
end
