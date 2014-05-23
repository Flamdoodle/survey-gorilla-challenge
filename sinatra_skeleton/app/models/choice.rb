class Choice < ActiveRecord::Base
  # Remember to create a migration!
  validates :survey_choice, presence: true

  belongs_to :question

end
