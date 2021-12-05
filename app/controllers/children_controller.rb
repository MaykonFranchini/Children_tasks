class ChildrenController < ApplicationController
  before_action :authenticate_child!

  def dashboard
    @child = Child.find(current_child.id)
    @transactions = Transaction.where(child_id: current_child.id)

    balance = 0
    @transactions.each do |transaction|
      if transaction.transaction_type == "deposit"
        balance = balance + transaction.amount
      else
        balance = balance - transaction.amount
      end
    end
    @balance = balance
  end
end
