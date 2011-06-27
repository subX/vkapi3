class PagesController < ApplicationController
  def user
	
	require "net/https"
	require "uri"
	uri = URI.parse("https://api.vkontakte.ru/oauth/access_token?client_id=2378090&client_secret=CI3ZOlAU8ZOhVyT5Efe1&code=#{params[:code]}")
	
	@uri=uri
	
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	
	request = Net::HTTP::Get.new(uri.request_uri)
	
	response = http.request(request)
	@code = JSON(response.body)
	@access_token = JSON(response.body)["access_token"]
  
	
	uri = URI.parse("https://api.vkontakte.ru/method/getProfiles?uid=#{JSON(response.body)["user_id"]}&fields=uid,bdate,city,sex,photo_rec&access_token=#{@access_token}")
	
	
	
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	
	request = Net::HTTP::Get.new(uri.request_uri)
	
	response = http.request(request)
	
	@response=JSON(response.body)
	
	user = User.new(:name => @response["response"][0]["first_name"], :idsn => @response["response"][0]["uid"], :surname => @response["response"][0]["last_name"], :age => @response["response"][0]["bdate"], :sex => @response["response"][0]["sex"], :city => @response["response"][0]["city"], :avatar => @response["response"][0]["photo_rec"])
	user.save
	@users = User.all


     
  




  end
  
  

def auth
  end
def home
  end


end
