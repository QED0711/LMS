class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :title
      t.integer :course_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
