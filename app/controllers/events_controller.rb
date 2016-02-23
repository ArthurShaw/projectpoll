class EventsController < ApplicationController
  def index
    @events = current_user.events.all
  end

  def create
    params[:event][:event_type] = params[:event][:event_type].to_i if params[:event][:event_type]
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:notice] = "Event created"
      redirect_to @event
    else
      render "new"
    end
  end

  def new
    @event = current_user.events.build
    @types = Event.event_types
    @action = "Create"
  end

  def edit
    @event = Event.find(params[:id])
    @types = Event.event_types
    @action = "Update"
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:notice] = "Event updated"
      redirect_to @event
    else
      render "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :description, :photo, :event_type)
  end
end
