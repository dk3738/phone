class CreateNewNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :new_notifications do |t|
      t.string :content
      t.string :link
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
