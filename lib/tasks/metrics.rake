namespace :metrics do

  desc "Fetch users count"
  task fetch_user_count: :environment do
    users = User.count
    @metric = Metric.new({ name: "user_count", value: users })
    if @metric.save
      puts "Metric of #{users} users saved to db!"
    else
      @error = @metric.errors.full_messages
      puts "There was an error! - #{@error}"
    end
  end

end