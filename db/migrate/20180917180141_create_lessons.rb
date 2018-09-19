class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.boolean :published
      t.integer :category_id
      t.timestamps
    end
  end
end
