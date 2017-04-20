class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.string :locale
      t.string :slug, null: false
      
      t.boolean :private, default: true

      t.timestamps
    end
  end
end