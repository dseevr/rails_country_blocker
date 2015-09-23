module RailsCountryBlocker
  module Controller

    def self.included(base)
    end

    def enforce_country_blocks
      ip   = request.headers["CF-Connecting-IP"]
      ip ||= request.headers["X-Forwarded-For"]
      ip ||= request.remote_ip

      if ip_in_blocked_country?(ip)
        raise "blocked bad actor from #{ip}"
      end
    end

  protected

    def load_database
      if RailsCountryBlocker.database_path.blank?
        raise "You must set RailsCountryBlocker.database_path to the location of your .mmdb file"
      end

      MaxMindDB.new(RailsCountryBlocker.database_path)
    end

    def country_block_database
      @country_block_database ||= load_database
    end

    def ip_in_blocked_country?(ip)
      ret = country_block_database.lookup(ip)

      ret.found? && RailsCountryBlocker.blocked_countries.include?(ret.country.iso_code)
    end

  end
end
