require 'rest-client'
require 'json'

module Zom
  class Mato
    attr_reader :client, :key, :headers

    def initialize(key)
      @key = key
      @headers = { 'Accept' => 'application/json', 'user-key' => key }
      @client = RestClient::Resource.new('https://developers.zomato.com/api/v2.1', headers: headers)
    end

    def get(url, params = {})
      response = if params
                   client[url].get(params)
                 else
                   client[url].get
                end

      JSON.parse(response)
    end
  end
end
