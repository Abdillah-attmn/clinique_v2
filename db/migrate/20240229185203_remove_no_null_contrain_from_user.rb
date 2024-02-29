class RemoveNoNullContrainFromUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :userable_type, :string, null: true
    change_column :users, :userable_id, :bigint, null: true
  end
end
