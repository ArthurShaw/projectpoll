class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :vkontakte]

  has_many :events, dependent: :destroy
  has_many :user_choices, dependent: :destroy

  class << self
    def from_omniauth(auth)
      where(email: auth.info.email).first_or_create do |user|
        user.uid = auth.uid
        user.provider = auth.provider
        user.email = auth.info.email
        user.name = auth.info.name
        user.password ||= Devise.friendly_token[1, 20]
        user.save!
      end
    end

    def from_vk(code)
      @client = VkontakteApi::Client.new
      @vk = VkontakteApi.authorize(code: code)
      @user = @client.users.get(uid: @vk.user_id)[0]
      where(email: @vk.email).first_or_create do |user|
        user.email = @vk.email
        user.name = @user.first_name + " " + @user.last_name
        user.uid = @vk.user_id
        user.provider = "vkontakte"
        user.password ||= Devise.friendly_token[1, 20]
        user.save!
      end
    end
  end
end
