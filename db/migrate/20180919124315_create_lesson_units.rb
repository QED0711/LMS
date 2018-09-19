class CreateLessonUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_units do |t|
      t.integer :lesson_id
      t.integer :unit_id
      
      t.timestamps
    end
  end
end
