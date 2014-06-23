class AddTimestampsToImages < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.timestamps
    end
  end
end
