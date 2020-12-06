class CreateSharecomments < ActiveRecord::Migration[6.0]
  def change
    create_table :sharecomments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :share, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
