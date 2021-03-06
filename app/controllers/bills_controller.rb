class BillsController < ApplicationController

  before_action :find_bill, only: [ :show, :pay ]

  def index
    @bills = current_user.bills
    @total = @bills.sum(:value)
    @paid = Bill.get_bills(@bills)['paid']
    @not_paid = Bill.get_bills(@bills)['not_paid']
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.user = current_user
    @bill.paid = false
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

  def clear_paid_bills
    paid_bills = current_user.bills.where(paid: true)
    paid_bills.destroy_all
    redirect_to bills_path
  end

  def pay
    @bill.toggle(:paid)
    @bill.save
    redirect_to bills_path
  end

  private

  def bill_params
    params.require(:bill).permit(:bill_name, :description, :value)
  end

  def find_bill
    @bill = Bill.find(params[:id]) if params[:id]
  end
end