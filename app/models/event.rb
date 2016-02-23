class Event < ActiveRecord::Base
  enum event_type: [:custom, :birthday, :holidays]

  belongs_to :user
  has_many :votes, dependent: :destroy
  validates_presence_of :event_type, :title
  has_attached_file :picture, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
