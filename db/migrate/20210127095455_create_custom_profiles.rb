class CreateCustomProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :custom_profiles do |t|
      t.references :user, null: false
      t.string :nickname
      t.string :birthplace
      t.text :introduction
      t.timestamps
    end
  end
end
