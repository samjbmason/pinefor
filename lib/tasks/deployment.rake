namespace :deploy do

  desc "Deploy to production server"
  task production: :environment do
    app = "pinefor.it"
    ssh = "ssh -t dokku@#{app} run #{app}"

    puts "Deploying app..."
    system "git push dokku master"
    puts "Migrating db..."
    system "#{ssh} rake db:migrate"
    puts "Updating cron jobs..."
    system "#{ssh} whenever -w"
    puts "ALl finished :)"
  end

end