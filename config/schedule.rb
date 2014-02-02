set :output, 'log/cron.log'

every :sunday, :at => '11:59 pm' do
  rake "metrics:fetch_user_count"
end