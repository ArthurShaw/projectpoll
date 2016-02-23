class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @events = current_user.events if current_user
  end
end
