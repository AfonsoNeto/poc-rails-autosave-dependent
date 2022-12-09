class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :asset, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
