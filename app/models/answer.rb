class Answer < ActiveRecord::Base
  belongs_to :vote, dependent: :destroy
  has_many :user_choices, dependent: :destroy
end
