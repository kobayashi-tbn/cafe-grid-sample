class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.date :limit_on
      t.boolean :done

      t.timestamps
    end
  end
end
