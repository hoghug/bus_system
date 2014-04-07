class Stop < ActiveRecord::Base
  belongs_to :station
  belongs_to :line
  has_many :arrivals
  has_many :buses, :through => :arrivals
  validates_uniqueness_of :station_id, :scope => [:line_id]
end
