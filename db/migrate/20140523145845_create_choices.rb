class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :survey_choice
      t.integer :tally

      t.belongs_to :question

      t.timestamps
    end
  end
end
