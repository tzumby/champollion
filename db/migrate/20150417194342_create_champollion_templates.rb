class CreateChampollionTemplates < ActiveRecord::Migration
  def change
    create_table :champollion_templates do |t|
      t.string :locale
      t.string :key
      t.text :value

      t.timestamps null: false
    end
  end
end
