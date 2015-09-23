require "maxminddb"

require "rails_country_blocker/controller"

module RailsCountryBlocker

  mattr_accessor :blocked_countries
  self.blocked_countries = []

  mattr_accessor :database_path

end

ActionController::Base.__send__(:include, RailsCountryBlocker::Controller)
