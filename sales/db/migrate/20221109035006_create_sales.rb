class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.string :name
      t.decimal :total
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
