class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :description
      t.boolean :completed

      t.timestamps
    end
  end
end
