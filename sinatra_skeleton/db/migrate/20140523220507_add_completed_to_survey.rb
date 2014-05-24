class AddCompletedToSurvey < ActiveRecord::Migration
  def change
    change_table :surveys do |t|
      t.boolean :completed, default: false
    end

  end
end
