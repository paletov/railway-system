class CreateRailwayStationsTable <  ActiveRecord::Migration
  def up
    create_table :railway_stations do |t|
      t.string :name, :null => false
      t.decimal :x
      t.decimal :y
    end
  end

  def down
    drop_table :railway_stations
  end
end