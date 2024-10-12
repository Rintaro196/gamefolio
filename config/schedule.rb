require File.expand_path(File.dirname(__FILE__) + "/environment")

rails_env = ENV["RAILS_ENV"] || :development

set :environment, rails_env

set :output, "#{Rails.root}/log/cron.log"

every 1.day, at: "5:00 am" do
  rake "igdb_accsess_token:get_access_token"
end
