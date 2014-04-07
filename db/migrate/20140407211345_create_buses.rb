class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :name
      t.belongs_to :line
    end

    create_table :arrivals do |t|
      t.time :time
      t.belongs_to :stop
      t.belongs_to :bus
    end
  end
end
