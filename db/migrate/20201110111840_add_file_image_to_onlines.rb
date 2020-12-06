class AddFileImageToOnlines < ActiveRecord::Migration[6.0]
  def change
    add_column :onlines, :file, :string
    add_column :onlines, :image, :string
  end
end
