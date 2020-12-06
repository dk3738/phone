class CreateOnlines < ActiveRecord::Migration[6.0]
  def change
    create_table :onlines do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :view_count

      t.timestamps
    end
    add_index :onlines, :view_count
  end
end
