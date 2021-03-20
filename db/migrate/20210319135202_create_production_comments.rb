class CreateProductionComments < ActiveRecord::Migration[6.0]
  def change
    create_table :production_comments do |t|
      t.references :user, null: false
      t.references :production, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
