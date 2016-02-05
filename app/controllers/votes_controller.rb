class VotesController < ApplicationController
    def index
	@votes = Vote.all
    end

    def create
	@event = Event.find(params[:vote][:event_id])
	@vote = @event.votes.build(vote_params)

	if @vote.save
	    flash[:notice] = "The poll is created"
	    redirect_to @vote
	else
	    render 'new'
	end
    end

    def new
	@event = Event.find(params[:event_id])
	@vote = @event.votes.build
	@vote.answers.build
	@action = "Create"
    end

    def show
	@vote = Vote.find(params[:id])
	@event = @vote.event
    end

    def edit
	@vote = Vote.find(params[:id])
	@event = Event.find(params[:event_id])
	@action = "Update"
    end

    def update
	@vote = Vote.find(params[:id])

	if @vote.update(vote_params)
	    flash[:notice] = "The poll is updated"
	    redirect_to @vote
	else
	    render 'edit'
	end
    end

    def destroy
	@vote = Vote.find(params[:id])
	@event = @vote.event
	@vote.destroy
	redirect_to @event
    end

    private

    def vote_params
	params.require(:vote).permit(:title, :event_id, answers_attributes: [:title, :_destroy, :id])
    end
end
