class TrainingsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @trainings = current_user.trainings.order(created_at: :desc).page(params[:page])
  end

  def show
    @training = Training.find(params[:id])
  end

  def new
    @training = Training.new
  end

  def create
    @training = current_user.trainings.build(training_params)

    if @training.save
      flash[:success] = 'Training が正常に投稿されました'
      redirect_to trainings_url
    else
      @trainings = current_user.trainings.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'Training が投稿されませんでした'
      render :new
    end
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    
    if @training.update(training_params)
      flash[:success] = 'Training は正常に更新されました'
      redirect_to @training
    else
      flash.now[:danger] = 'Training は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy

    flash[:success] = 'Training は正常に削除されました'
    redirect_to trainings_url
  end
  
  private

  # Strong Parameter
  def training_params
    params.require(:training).permit(:content,:date,:kg1,:rep1,:kg2,:rep2,:kg3,:rep3,:kg4,:rep4,:kg5,:rep5)
  end
end
