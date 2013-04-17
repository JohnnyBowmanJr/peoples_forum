class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :suggestion_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
