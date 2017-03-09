class UrlsController < ApplicationController
	def index
  	@urls = Url.all.sort
  end

  def new 
  	@url = Url.new
  end

  def create 
		@url = Url.new(url_params)
   		if @url.save
   			redirect_to urls_path
   		else
   			render 'new'
   		end
  end

  def edit
 		@url = Url.find(params[:id])
    @url.click_count += 1
    @url.save
    redirect_to urls_path
	end

  private 
  	def url_params
  		params.require(:url).permit(:original)		
  	end 

end
