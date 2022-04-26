class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :lesson_title
      t.text :lesson_description
      t.string :lesson_url
      
      t.timestamps
    end
  end
end
