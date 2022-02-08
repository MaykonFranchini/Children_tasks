namespace :child do
  desc "Add weekly allowance for all childrens at subscription table "
  task add_child_allowance: :environment do
    if Date.today.monday?
      TransactionJob.perform_later
    end
  end

end
