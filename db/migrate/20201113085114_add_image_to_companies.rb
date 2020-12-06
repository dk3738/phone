class AddImageToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :image, :string
  end
end
