class CreateManagementComments < ActiveRecord::Migration[6.0]
  def change
    create_table :management_comments do |t|
      t.references :user, null: false
      t.references :management, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
