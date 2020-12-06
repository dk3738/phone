class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :view

      t.timestamps
    end
    add_index :companies, :view
  end
end
