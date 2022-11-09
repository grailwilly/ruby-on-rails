class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :sale, null: false, foreign_key: true
      t.decimal :quantity
      t.decimal :total

      t.timestamps
    end
  end
end
