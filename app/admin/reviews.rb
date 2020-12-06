ActiveAdmin.register Review do
  index do
    selectable_column
    id_column
    column :user
    column :title
    column :created_at
    column :updated_at
    actions
  end
  
end
