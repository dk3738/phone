class CreateFreecomments < ActiveRecord::Migration[6.0]
  def change
    create_table :freecomments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :free, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
