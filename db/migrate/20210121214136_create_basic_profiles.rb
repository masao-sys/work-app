class CreateBasicProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :basic_profiles do |t|
      t.references :user, null: false
      t.string :name
      t.date :birthday
      t.integer :gender
      t.integer :department
      t.timestamps
    end
  end
end
