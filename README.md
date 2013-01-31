Triggering the Delayed Job crash when using New Relic ruby agent 3.5.5.38

Environment
-----------
* Mac OS X 10.7.5
* Postgresql 9.1.3
* Rails 3.2.11
* ruby1.9.3-p287 and p374
* bundler 1.2.1
* rake 10.0.3
* rvm 1.11.3.3

Setup
-----
* Clone this repo
* ```bundle install --path vendor --binstubs```
* ```cp config/newrelic.yml.example config/newrelic.yml``` and add your API key
* create a postgres database to match ```config/database.yml```
* run the migrations:  ```rake db:migrate```

Trigger the Crash
-----------------
Start up delayed job:

    $ bundle exec script/delayed_job run
    delayed_job: process with pid 89879 started.

In a separate prompt:

    rake dj_test:send_test_email

After sending the email, delayed_job will crash with:

    FATAL:  invalid frontend message type 1
    PG::Error: connection not open
    : UPDATE "delayed_jobs" SET locked_by = null, locked_at = null WHERE (locked_by = 'delayed_job host:xxxx.local pid:89879')