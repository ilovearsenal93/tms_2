class TraineesController < ApplicationController
  before_action :signed_in_trainee, only: [:show,:index,:edit, :update]
  before_action :be_trainee
  before_action :correct_trainee,   only: [:edit, :update]

  def new
  end

  def index
    @trainees = Trainee.paginate page: params[:page] 
  end

  def show
    @trainee = Trainee.find params[:id]
    @enrolls = @trainee.enrolls
    @trainee_subjects = @trainee.trainee_subjects
    @assigned_tasks = @trainee.assigned_tasks
    @activity_log = Array.new
  end

  def edit
    @trainee = Trainee.find params[:id]
  end

  def create
    @trainee = Trainee.new
    if @trainee.save
      sign_in @trainee
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @trainee
    else
      render 'new'
    end
  end

  def update
    @trainee = Trainee.find params[:id]
    if @trainee.update_attributes(trainee_params)
      flash[:success] = "Profile updated"
      redirect_to @trainee
    else
      render 'edit'
    end
  end

  def destroy
  end
  private

    def trainee_params
      params.require(:trainee).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters
    def correct_trainee
      @trainee = Trainee.find params[:id] 
      redirect_to(root_url) unless current_trainee?(@trainee)
    end

    def signed_in_trainee
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in." unless signed_in?
      end
    end
end
