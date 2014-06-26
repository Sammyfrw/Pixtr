class CreateTag < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tagname, null: false 
      t.timestamps
    end

    add_index :tags, :tagname, unique: true
  end
end
