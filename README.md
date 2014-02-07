# Pinefor
## formally getgft

### Local setup
- Clone repo
- Make sure your running the correct ruby version. Check in `.ruby-version` (if using something like rbenv or rvm should throw warning)
- Run bundle install (optionally - use rbenv gemsets to which install to `/vendor/bundle`)
- Run `rake db:migrate`

### Pushing to server
Currently runnin on a digital ocean droplet (1GB RAM). Uses dokku for mini paas setup. To deploy run `rake deploy:prod`, this does a few things:
- runs `git push dokku master`
- After that runs `rak db:migrate` in case any new database changes
- Runs `whenever -w` which update the crontab with any new crons.

Obviously you could run these yourself but its just a nice little wrapper.

### Notes
I like to test that my cron jobs are doing what they are supposed to be doing so on your local system you can run `whenever -w` to setup a the crontab (running it multiple times will still only write tke number of task you have). As you probably dont want cron running locally you can delete your cron jobs with `whenever -c`.

I also have used this modular scale to setup sizes, margins etc. [My Modular scale](http://modularscale.com/scale/?px1=18&px2=238&ra1=1.618&ra2=0) 