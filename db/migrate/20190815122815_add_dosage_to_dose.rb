class AddDosageToDose < ActiveRecord::Migration[5.2]
  def change
      add_column :doses, :dosage, :integer
  end
end
