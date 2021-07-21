class ReserversController < ApplicationController
  def index
    @reservers = Reserver.all
  end
  
  def new
    @reserver = Reserver.new
    @reserver.greenhouse = 
    @greenhouse = Greenhouse.find(params[:format])
  end
  
  def create
   @reserver = Reserver.new(params.require(:reserver).permit(:start, :end, :number, :total, :user_id, :greenhouse_id))
        if @reserver.save
          flash[:notice] = "新規予約をしました"
          redirect_to action: :index
        else
         @greenhouse = Reserver.find(params[:reserver][:greenhouse_id])
         render :new
        end
  end

  def show
    @reserver = Reserver.find(params[:id])
  end
  
  def edit
    @reserver = Reserver.find(params[:id])
  end
  
  def update
    @reserver = Reserver.find(params[:id])
        if @reserver.update(params.require(:reserver).permit(:start, :end, :number, :total, :user_id, :greenhouse_id))
          flash[:notice] = "投稿を更新しました"
          redirect_to :reservers
        else
          render "edit"
        end
  end
  
  def destroy
    @reserver = Reserver.find(params[:id])
        @reserver.destroy
        flash[:notice] = "投稿を削除しました"
        redirect_to :reservers
  end
end