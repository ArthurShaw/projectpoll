class Vote < ActiveRecord::Base
  belongs_to :event
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :title
end
