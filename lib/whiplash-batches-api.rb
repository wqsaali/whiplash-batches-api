require "whiplash/batches/version"
require "whiplash/batches/api"

module Whiplash
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :whiplash_email, :whiplash_password, :whiplash_base_url
  end
end
