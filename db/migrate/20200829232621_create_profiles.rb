class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :sector
      t.string :region
      t.string :company

      t.timestamps
    end
  end
end
