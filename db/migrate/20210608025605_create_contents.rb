class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title,            null: false
      t.integer :money,           null: false
      t.datetime :start_time

      t.timestamps
    end
  end
end
