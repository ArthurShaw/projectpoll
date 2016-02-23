class UserChoicesController < ApplicationController
  def create
    @vote = Vote.find(params[:user_choice][:vote_id])
    @choice = current_user.user_choices.build(user_choice_params)

    if @choice.save
      flash[:notice] = "Voted succesfully"
      redirect_to @vote.event
    else
      render 'new'
    end
  end

  def new
    @vote = Vote.find(params[:vote_id])
    @choice = current_user.user_choices.build
  end

  def edit
    @choice = UserChoice.find(params[:id])
    @vote = @choice.answer.vote
  end

  def update
    @choice = UserChoice.find(params[:id])

    if @choice.update(user_choice_params)
      flash[:notice] = "Revoted succesfully"
      redirect_to @choice.answer.vote
    else
      render 'edit'
    end
  end

  def destroy
    @choice = UserChoice.find(params[:id])
    @choice.destroy
  end

  private

  def user_choice_params
    params.require(:user_choice).permit(:user_id, :answer_id)
  end

end
