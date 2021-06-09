class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.date :registerdate
      t.date :duedate
      t.string :task
      t.integer :user_id

      t.timestamps
    end
  end
end
