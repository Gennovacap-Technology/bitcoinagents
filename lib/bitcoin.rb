require 'net/http'
require 'uri'
require 'json'


class Bitcoin
	def initialize(service_url)
		@uri = URI.parse(service_url)
	end
   
	def method_missing(name, *args)
		post_body = { 'method' => name, 'params' => args, 'id' => 'jsonrpc' }.to_json
		resp = JSON.parse( http_post_request(post_body) )
		raise JSONRPCError, resp['error'] if resp['error']
		resp['result']
	end
		 
	def http_post_request(post_body)
		http    = Net::HTTP.new(@uri.host, @uri.port)
		request = Net::HTTP::Post.new(@uri.request_uri)
		request.basic_auth @uri.user, @uri.password
		request.content_type = 'application/json'
		request.body = post_body
		http.request(request).body
	end

	def get_rates
		url 	= URI.parse("http://data.mtgox.com/api/2/BTCUSD/money/ticker_fast")
		http 	= Net::HTTP.new(url.host, url.port)
		request = Net::HTTP::Get.new(url.request_uri)
		request.content_type = 'application/json'
		JSON.parse(http.request(request).body)
	end
		   
	class JSONRPCError < RuntimeError; end
end