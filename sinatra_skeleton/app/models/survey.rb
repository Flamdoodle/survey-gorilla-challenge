class Survey < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, presence: true

  has_many :questions
  has_many :completed_surveys
  belongs_to :user

end
