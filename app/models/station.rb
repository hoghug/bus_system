class Station < ActiveRecord::Base
  has_many :lines, :through => :stops
  has_many :stops

end
