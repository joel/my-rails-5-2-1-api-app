class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :uuid do |t|
      t.string :title, null: false
      t.boolean :done, default: false, null: false
      t.references :todo, type: :uuid, null: false

      t.timestamps
    end
  end
end
