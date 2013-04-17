class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :body
      t.integer :votes
      t.integer :employee_id

      t.timestamps
    end
  end
end
