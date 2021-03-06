class CreateRoutesTable <  ActiveRecord::Migration
  def up
    create_table :routes do |t|
      t.string :name, :null => false
      t.string :company_name, :null => false
      t.boolean :is_deleted
    end
  end

  def down
    drop_table :routes
  end
end