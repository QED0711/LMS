class CreateCourseLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :course_lessons do |t|
      t.integer :lesson_id
      t.integer :course_id

      t.timestamps
    end
  end
end
