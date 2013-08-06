class CreateUsersTable <  ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name, :null => false
      t.string :password, :null => false
      t.integer :role_id, :null => false
    end
  end

  def down
    drop_table :users
  end
end