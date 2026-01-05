class SchedulesController < ApplicationController
   def index
    @schedules = Schedule.order(:start_at)
    @schedule = Schedule.new
  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path, notice: "予定を作成しました"
    else
      @schedules = Schedule.all
      flash.now[:alert] = "入力内容に誤りがあります"
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedules_path, notice: "予定を更新しました"
    else
      flash.now[:alert] = "入力内容に誤りがあります" 
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, notice: "予定を削除しました"
  end

  private

  def schedule_params
    params.require(:schedule).permit(
      :title,
      :start_at,
      :end_at,
      :memo,
      :all_day
      )
  end  
end