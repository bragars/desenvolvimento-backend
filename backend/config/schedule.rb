set :output, "log/cron.log"

every :day, at: '18:50pm' do #-->working
    rake 'prepare:send_email'
    rake 'update:database'
end

every 1.month, at: '18:50pm' do #-->working
    rake 'update_monthly:database'
end

#whenever --update-crontab --set environment='development'