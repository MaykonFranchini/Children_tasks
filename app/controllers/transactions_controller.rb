class TransactionsController < ApplicationController

  def new
  @transaction = Transaction.new
  end

  def create

    child = Child.find(params["transaction"]["account_id"])
    new_account = Account.where(child_id: params["transaction"]["account_id"])[0]

    if new_account.blank?
      new_account = Account.create(child: child)
    end

    @transaction = Transaction.new(transaction_params)
    @transaction.account = new_account

    new_balance = @transaction.transaction_type.downcase == 'deposit' ? new_account.balance + @transaction.amount.to_i : new_account.balance - @transaction.amount.to_i
    new_account.update(balance: new_balance)

    if @transaction.save

      notification = Notification.where(child_id: child)[0]
      if notification.blank?
        notification = Notification.new(child_id: child.id)
        notification.save
      end


      message = Message.new(child_id: child.id, notification_id: notification.id, content: "New transaction. #{@transaction.transaction_type.capitalize} of £ #{@transaction.amount}. - #{@transaction.description}")

      if message.save
        redirect_to child_path(child)
      end
    else
    render :new
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])
    account = Account.find(transaction.account_id)
    balance = transaction.transaction_type.downcase == 'deposit' ? account.balance - transaction.amount.to_i : account.balance + transaction.amount.to_i
    account.update(balance: balance)
    transaction.destroy
    redirect_to child_path(account.child_id)
  end

  private
    def transaction_params
      params.require(:transaction).permit(:transaction_type, :description, :amount, :account_id)
    end
end
