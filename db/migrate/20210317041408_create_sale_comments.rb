class CreateSaleComments < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_comments do |t|
      t.references :user, null: false
      t.references :sale, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
