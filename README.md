# AceBook

[You can find the week outline here.](https://github.com/makersacademy/course/tree/acebook/acebook)

[The card wall is here](https://trello.com/b/HPE5W1E6/acebook) (Need an invite? Ask on Slack!)

## NOTE

Database has been changed from SQLite to Postgresql. If you are getting an error from your latest pull request please rerun the 'quickstart' process to update the DB ORM and initialize the new DB locally.

## Quickstart

First, clone this repository. Then:

```bash
bundle install
bin/rails db:create
bin/rails db:migrate

bundle exec rspec # Run the tests to ensure it works
bin/rails server # Start the server at localhost:3000
```

## Stack

We're using:

* RSpec for testing
* [Clearance](https://github.com/thoughtbot/clearance) for user authentication

## Images Resized

Uploaded images are all same height, keep the correct aspect ratio.
