# Padrino Blog

We're going to make a blog using Padrino.

# INSTALL

* Fork this repo, git clone as normal
* cd PadrinoBlog
* padrino g project PadrinoBlog -d activerecord -e erb -t shoulda -b .
* Don't forget to add the following to your Gemfile:

    gem "database_cleaner"

* And drop the following code in test/test_config.rb

    def setup 
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
    end

    def teardown
      DatabaseCleaner.clean
    end

* Don't forget to run bundle

# TODO

* Generate the models given in this image using padrino g model blah

    http://dl.dropbox.com/u/20721984/20130410_155358.jpg

* Don't forget to create your test database

    padrino rake -e test ar:create

* Don't forget to migrate to your test database

    padrino rake -e test ar:migrate

* Run with 

    padrino rake test:models

* Docs at

    padrino rake -T