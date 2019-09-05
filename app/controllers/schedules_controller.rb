class SchedulesController < ApplicationController
  before_action :authenticate_account!, only: %i[new create edit update]

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params_schedule)
    @personal = current_account
    if @schedule.save
      flash[:notice] = "Cadastrado com sucesso"
      redirect_to @schedule
    else
      flash.now[:notice] = "Erro ao cadastrar agenda"
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def my_schedule
    @schedule = Schedule.where(personal: current_account)
  end

  private

  def params_schedule
    params.require(:schedule).permit(:date, :start, :finish, :price, :unit_id, :personal_id)
  end
end