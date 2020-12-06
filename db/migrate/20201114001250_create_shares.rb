class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :image
      t.text :description
      t.integer :view_count

      t.timestamps
    end
    add_index :shares, :view_count
  end
end
