class TransactionJob < ApplicationJob
  queue_as :default

  def perform
    puts 'New job'
    sleep 5
    puts 'Job finished'
  end
end
