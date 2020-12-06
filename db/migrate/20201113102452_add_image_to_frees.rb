class AddImageToFrees < ActiveRecord::Migration[6.0]
  def change
    add_column :frees, :image, :string
  end
end
