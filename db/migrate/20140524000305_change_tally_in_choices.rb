class ChangeTallyInChoices < ActiveRecord::Migration
  def change
    change_column :choices, :tally, :integer, default: 0
  end
end
