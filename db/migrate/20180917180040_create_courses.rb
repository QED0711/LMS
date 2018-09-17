class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.datetime :active_start_date
      t.datetime :active_end_date

      t.timestamps
    end
  end
end
