class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :subject, null: false
      t.text :body
      t.integer :status, null: false, default: 0
      t.datetime :start_at
      t.datetime :closing_at

      t.timestamps
    end
  end
end
