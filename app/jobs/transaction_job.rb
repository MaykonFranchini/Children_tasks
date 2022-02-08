class TransactionJob < ApplicationJob
  queue_as :default

  def perform
    subscriptions = Subscription.all

    subscriptions.each do |subscription|

      account = Account.find(subscription.child_id)
       newTransaction = Transaction.new(transaction_type: 'Deposit', amount: subscription.amount, description: subscription.description)
       newTransaction.account = account

       puts  "#{newTransaction.transaction_type}"
       puts  "#{newTransaction.amount}"
       puts  "#{newTransaction.description}"
       puts  "#{account.id}"


       if newTransaction.save
          new_balance = account.balance + subscription.amount
          account.update(balance: new_balance)
          puts 'Transaction done'
        end
    end

  end
end
