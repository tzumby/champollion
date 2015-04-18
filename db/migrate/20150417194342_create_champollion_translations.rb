class CreateChampollionTranslations < ActiveRecord::Migration
  def change
    create_table :champollion_translations do |t|
      t.string :locale
      t.string :key
      t.text :value

      t.timestamps null: false
    end
  end
end
