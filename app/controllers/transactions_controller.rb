class TransactionsController < ApplicationController

  def new
  @transaction = Transaction.new
  end

  def create
    if Account.where(:child_id => params["transaction"]["account_id"]).blank?
      child = Child.find(params["transaction"]["account_id"])
      account = Account.create(child: child)
    else
      account = Account.find(params["transaction"]["account_id"])
    end

    @transaction = Transaction.new(transaction_params)
    @transaction.account = account

    if @transaction.transaction_type == 'Deposit'
      new_balance = account.balance + @transaction.amount.to_i
      account.update(balance: new_balance)
    else
      new_balance = account.balance - @transaction.amount.to_i
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
