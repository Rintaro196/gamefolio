set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
<<COMMENTOUT
bundle exec rake igdb_access_token:get_access_token
COMMENTOUT