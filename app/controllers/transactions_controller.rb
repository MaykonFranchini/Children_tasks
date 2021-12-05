class TransactionsController < ApplicationController

  def new
  @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to '/user'
    else
    render :new
    end
  end

  private
    def transaction_params
      params.require(:transaction).permit(:type, :description, :amount, :child_id)
    end
end
