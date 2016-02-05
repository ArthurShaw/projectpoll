class Event < ActiveRecord::Base
    enum event_type: [:custom, :birthday, :holidays]
    
    belongs_to :user
    has_many :votes, dependent: :destroy
    validates_presence_of :event_type, :title
end
