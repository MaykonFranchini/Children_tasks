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
      child = params['transaction']['account_id']
      if Notification.find(child).blank?
        notification = Notification.create(child_id: child)
      else
        notification = Notification.find(child)
      end

      message = Message.new(child_id: child, notification_id: notification.id, content: "You have a #{@transaction.transaction_type} of £ #{@transaction.amount}.")
      if message.save
        redirect_to child_path(message.child_id)
      end
    else
    render :new
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])
    if transaction
      account = Account.find(transaction.account_id)
      if transaction.transaction_type.downcase == 'deposit'
        balance = account.balance - transaction.amount
        account.update(balance: balance)
     else
       balance = account.balance + transaction.amount
       account.update(balance: balance)
     end
     transaction.destroy
     redirect_to child_path(account.child_id)
    end
  end

  private
    def transaction_params
      params.require(:transaction).permit(:transaction_type, :description, :amount, :account_id)
    end
end
