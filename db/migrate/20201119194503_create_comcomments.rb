class CreateComcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :comcomments do |t|
      t.belongs_to :user
      t.belongs_to :company
      t.text :content

      t.timestamps
    end
  end
end
