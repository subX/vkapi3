class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :idsn
      t.string :city
      t.string :sex
      t.string :age

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
