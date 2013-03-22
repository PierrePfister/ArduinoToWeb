class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.float :sensorTemp

      t.timestamps
    end
  end
end
