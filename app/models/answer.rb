class Answer < ActiveRecord::Base
  belongs_to :vote
  has_many :user_choices, dependent: :destroy
end
