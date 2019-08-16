class RemoveDosageFromDoses < ActiveRecord::Migration[5.2]
  def change
    remove_column :doses, :dosage
  end
end
