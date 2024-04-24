class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :speciality
      t.integer :experience_year

      t.timestamps
    end
  end
end
