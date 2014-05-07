SpreeImportPromotions
=====================

This extension is to import CSV files in order to create promotions.

A raw example of a csv file

```
NAME,CODE,DESCRIPTION,USAGE LIMIT,STARTS AT,EXPIRES AT,ACTIONS,CALCULATOR,AMOUNT,CURRENCY
Promotion1,FOOBAR123,Promotion1 Description,1,2014-05-01,2014-10-01,Create whole-order adjustment,Flat Rate,30,USD
Promotion2,FOOBAR456,Promotion1 Description,1,2014-05-01,2014-10-01,Create whole-order adjustment,Flat Rate,30,USD
```

Installation
------------

Add spree_import_promotions to your Gemfile:

```ruby
gem 'spree_import_promotions', github: 'david-vega/spree_import_promotions'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_import_promotions:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_import_promotions/factories'
```

spree_import_promotions by David Vega. Based on [Steven Barragan Import Promotions](https://github.com/stevenbarragan/spree_import_promotions)
