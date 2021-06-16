class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.integer :target,      null: false
      t.references :user,     null: false, foreign_key: true
      t.date :target_month,   null: false

      t.timestamps
    end
  end
end
