class CreateRailwayStationsTable <  ActiveRecord::Migration
  def up
    create_table :railway_stations do |t|
      t.string :name, :null => false
      t.decimal :x
      t.decimal :y
      t.boolean :is_deleted
    end
  end

  def down
    drop_table :railway_stations
  end
end