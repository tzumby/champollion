# This migration comes from champollion (originally 20150417194342)
class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :locale
      t.string :key
      t.text :value
      t.text :interpolations
      t.boolean :is_proc, default: false

      t.timestamps null: false
    end
  end
end
