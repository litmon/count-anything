class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.string :name
      t.string :image, default: ""
      t.integer :number, default: 0

      t.timestamps null: false
    end
  end
end
