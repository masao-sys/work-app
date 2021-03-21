class CreateDevelopmentComments < ActiveRecord::Migration[6.0]
  def change
    create_table :development_comments do |t|
      t.references :user, null: false
      t.references :development, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
