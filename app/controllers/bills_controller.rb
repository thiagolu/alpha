class BillsController < ApplicationController

  before_action :find_bill, only: :show

  def index
    @bills = current_user.bills
    @total = @bills.sum(:value)
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.user = current_user
    if @bill.save
      flash[:success] = "Conta Criada"
      redirect_to bills_path
    else
      flash[:danger] = "Conta não foi Criada"
      render 'new'
    end
  end

  def show
    
  end

  private

  def bill_params
    params.require(:bill).permit(:bill_name, :description, :value)
  end

  def find_bill
    @bill = Bill.find(params[:id]) if params[:id]
  end
end