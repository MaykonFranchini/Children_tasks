class TransactionsController < ApplicationController

  def new
  @transaction = Transaction.new
  end

  def create
    account = Account.find(params["transaction"]["account_id"])
    if account.nil?
      account = Account.create(child: params["transaction"]["account_id"])
    end

    @transaction = Transaction.new(transaction_params)
    @transaction.account = account

    if @transaction.transaction_type == 'deposit'
      new_balance = account.balance + @transaction.amount
      account.update(balance: new_balance)
    else
      new_balance = account.balance - @transaction.amount
      account.update(balance: new_balance)
    end

    if @transaction.save
      redirect_to '/user'
    else
    render :new
    end
  end

  private
    def transaction_params
      params.require(:transaction).permit(:transaction_type, :description, :amount, :account_id)
    end
end
