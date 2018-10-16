class PagesController < ApplicationController

	def about
        @title =  'About us';
        @content = 'this is the about page';
	end 
	
end
