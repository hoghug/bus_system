class Bus < ActiveRecord::Base
  belongs_to :line
  has_many :arrivals
  has_many :stops, :through => :arrivals
  has_many :stations, :through => :stops
end
