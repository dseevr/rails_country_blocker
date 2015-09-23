# Rails Country Blocker

This plugin lets you prevent entire countries from accessing your Rails app at a controller level.  It requires one of MaxMind's GeoIP databases (free or paid, city or country level) to function.  If you need a MaxMind database, you can [download the free GeoLite2 Country database](http://dev.maxmind.com/geoip/geoip2/geolite2/).

I decided to write this after seeing stories on Hacker News about small e-commerce sites being destroyed by credit card fraud from China, Russia, Vietnam, etc.  I wouldn't rely on this as your sole anti-fraud mechanism, but it should have a big effect on cutting down the malicious traffic to your app.

## Usage

Create **config/initializers/rails\_country\_blocker.rb** and set your MaxMind DB path and list of blocked countries:

```ruby
RailsCountryBlocker.database_path = "/path/to/maxmind.mmdb"
RailsCountryBlocker.blocked_countries = %w[CN RU VN]
```

You can either check the MaxMind db into your repo and use a database_path based on Rails.root, or you can keep it outside the repo.  MaxMind provides [an auto-updater script](http://dev.maxmind.com/geoip/geoipupdate/) which you can run via cron if you keep it outside the repo.

Now just add:

```ruby
before_filter :enforce_country_blocks
```

to any controller whose actions you want to protect.  To protect your entire app, add it at the top of ApplicationController.

## Notes

I have no idea how to properly test this using stubs/mocks.  Feel free to send a PR and I'll credit you here.

## TODO

* Add proper tests
* Do something smarter than just raise an Exception (logging? analytics?)
* Maybe support reading the gzipped MaxMind database directly (the country one is only ~900kb)
* Raise an exception at app startup if the DB doesn't exist or can't be read
* Show a warning if the plugin is installed and configured but no countries are blocked

## License

BSD
