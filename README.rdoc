
Before runnig it locally:

1. Create `secret.yml` and `database.yml`.
2. Run `bundle install`
3. Run `bundle exec rake db:automigrate`
4. Run `bundle exec rake environment elasticsearch:import:all CLASS="Comment"`
