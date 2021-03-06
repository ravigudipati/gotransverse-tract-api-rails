# GoTransverseTractApi Ruby Gem

A ruby gem allowing developers to conveniently integrate with GoTransverse's TRACT API.

Current supported version is 1.29 REST API (XML)
https://documentation.gotransverse.com/Content/Archive/site/tract.gotransverse.com/Developer-Guides/TRACT-API-1.29/REST-Endpoints.html

For more details, please refer to GoTransverse's TRACT API Documentation available at:
https://documentation.gotransverse.com/Content/Archive/site/tract.gotransverse.com/User-%26-Administrator-Guides/Understanding-TRACT.html

## Disclaimer

While we are all gladly contributing to the community...

This gem is unofficial, may contain bugs, and its use is at your own risk.
None of the project owners, developers, contributors may be held accountable for any defect or disaster resulting of the direct or indirect use of this gem.


## Installation

Add this line to your application's Gemfile:

    gem 'gotransverse-tract-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gotransverse-tract-api


## Configuration

From the application utilizing the gem, create a gotransverse_tract_api.rb file to your config/initializers folder, with content:

```
#!ruby
GoTransverseTractApi.configure do |config|
  config.username = <gotransverse_tract_username>
  config.password = <gotransverse_tract_password>
  config.tract_api_host = <gotransverse_tract_api_host>
end
```

## Usage

```
#!ruby

GoTransverseTractApi::BillingAccount::Invoice.find_by_eid(<eid>)

products = GoTransverseTractApi::Product::Product.find_all

product = GoTransverseTractApi::Product::Product.find_by_eid(<eid>)
product.symbolize_keys!

product_price = GoTransverseTractApi::Product::RecurringProductPrice.find_by_product_eid(product[:eid])

```

## Version History & Changelog

Visit https://rubygems.org/gems/gotransverse-tract-api


## Roadmap

* Nov 2015: Initial Release, basic REST/XML API Support
* Dec 2015: PCI-Compliant Hosted Payment Page URL Support
* Q1 2016: Automated Test Coverage
* Q2 2016: REST/JSON API Support


## Contributing

Help and advice is gladly appreciated! :)
Feel free to contribute and be part of this project, helping the community staying on top of any new API version release.

Please keep version number increments under control :)

1. Fork it ( https://github.com/[my-github-username]/gotransverse-tract-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Authors

* Julien DeFrance
* Ravikumar Gudipati


## Donations

Love this project? Use it for your business?

Reward our developers and help us keep this project active.

[![Click here to donate][2]][1] [![Click here to donate][4]][3] [![Click here to donate][6]][5] or more! :)

  [1]: https://www.bountysource.com/cart?amount=100&currency=USD&team_id=gotransverse-tract-api-rails
  [2]: http://img.shields.io/badge/donate-$100-brightgreen.svg (Click here to donate)
  [3]: https://www.bountysource.com/cart?amount=250&currency=USD&team_id=gotransverse-tract-api-rails
  [4]: http://img.shields.io/badge/donate-$250-brightgreen.svg (Click here to donate)
  [5]: https://www.bountysource.com/cart?amount=500&currency=USD&team_id=gotransverse-tract-api-rails
  [6]: http://img.shields.io/badge/donate-$500-brightgreen.svg (Click here to donate)

