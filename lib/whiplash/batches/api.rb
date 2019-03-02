require 'whiplash/batches/version'
require 'mechanize'
module Whiplash
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :email, :password, :whiplash_url
  end

  class Batches::Api
    attr_reader :agent, :current_page

    def initialize
      @username = @email 
      @password = @password
      @login_url = "#{@whiplash_url]}/login" 
      @agent = Mechanize.new
      login
    end

    def batches(page = 1, ignore_ids = [])
      results = []
      ignore_ids.map!(&:to_s) # convert to ids of string
      @current_page = agent.get("#{@whiplash_url]}/order_batches?page=#{page}")
      results << build_batch_hash(current_page, ignore_ids)
      page += 1 # page is scrapped already
      loop do
        next_page = current_page.links.find{ |l| l.href.to_s.include?("/order_batches?page=#{page}") }
        if next_page.present?
          batch_page = next_page.click
          results << build_batch_hash(batch_page, ignore_ids)
          page += 1
        else
          break
        end
      end
      
      results.flatten
    end

    def orders(batch_id = '437749')
      @current_page = agent.get("#{@whiplash_url]}/order_batches/#{batch_id}")
      orders = current_page.links.select { |l| l.href.to_s.match(/\/orders\/.*/) }
      orders.map{ |l| l.text.split('-').first }
    end

    def login
      page = agent.get(@login_url)
      @current_page = page.form_with(:id => 'new_user') do |form|
        form.field_with(name: 'user[email]').value = @username
        form.field_with(name: 'user[password]').value = @password
      end.submit
    end

    private

    def build_batch_hash(current_page, ignore_ids)
      records = []
      table = current_page.search('table#order-batches')[0]
      if table.present?
        headers = table.search('thead tr th').map{ |th| th.text.downcase.parameterize.underscore }
        table.search('tbody tr').each do |tr|
          next if ignore_ids.include?(tr.at('td a').text.strip)
          hash = {}
          tr.elements.each_with_index do |td, index|
            hash[headers[index]] = td.at('a').present? ? td.at('a').text.strip : td.text.strip
          end
          hash['order_ids'] = orders(hash['batch']) 
          records << hash
        end
      end
      records
    end
  end
end
