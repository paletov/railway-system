class CreateEdgesTable <  ActiveRecord::Migration
  def up
    create_table :edges do |t|
      t.integer :route_id, :null => false
      t.integer :number_in_route, :null => false
      t.integer :start_railway_station_id, :null => false
      t.integer :end_railway_station_id, :null => false
      t.datetime :start_datetime, :null => false
      t.datetime :end_datetime, :null => false
      t.integer :price, :null => false
      t.boolean :is_deleted
    end
  end

  def down
    drop_table :edges
  end
end