class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :data
      t.integer :type
      t.integer :lesson_id

      t.timestamps
    end
  end
end
