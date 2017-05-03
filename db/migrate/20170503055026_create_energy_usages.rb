class CreateEnergyUsages < ActiveRecord::Migration[5.1]
  def change
    create_table :energy_usages do |t|
      t.references :building
      t.references :measurement
      t.integer :year
      Date::ABBR_MONTHNAMES.compact.map(&:downcase).each do |month|
        t.float month
      end
      t.float :total
      t.timestamps
    end
    add_index :energy_usages, :year
  end
end
