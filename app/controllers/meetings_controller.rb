class MeetingsController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :destroy, :new, :create]
	before_filter :mod_user,  only: [ :destroy, :new, :create, :edit, :update]
	def show
		@meeting = Meeting.find(params[:id])
	end

	def index
		@meetings = Meeting.paginate(page: params[:page])
	end

	def new
		if !signed_in?
      redirect_to(signin_path)
    else
			@meeting = Meeting.new
		end
	end

	def create
		@meeting = Meeting.new(params[:meeting])
		if @meeting.save
			flash[:success] = "Meeting created successfully!"
      redirect_to @meeting
    else
    	render 'new'
    end
	end

	def edit
		@meeting = Meeting.find(params[:id])
	end

	def update
		@meeting = Meeting.find(params[:id])
		if @meeting.update_attributes(params[:meeting])
			flash[:success] = "Meeting updated"
      redirect_to @meeting
    else
    	render 'edit'
    end
	end

	def destroy
		Meeting.find(params[:id]).destroy
		flash[:success] = "Meeting deleted."
    redirect_to meetings_url
	end
end