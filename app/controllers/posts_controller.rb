class PostsController < ApplicationController
   #basic auth index and show are the only pages you can view without auth
   http_basic_authenticate_with name: "Tosin", password: "secret", except: [:index, :show]

  #method to indicate all post should render on the index page
	def index
        @posts = Post.all
	end

    #method to show the ppost 
	def show

            #pass in the post id from the url
         @post = Post.find(params[:id])
	end  

    #method to confirm validation 
	def new
           @post = Post.new
	end 

	def create
        #render plain: params[:post].inspect
        
        @post = Post.new(post_params)
 
         if(@post.save)
         
         #go to show
        redirect_to @post

    else 
    	render 'new'

	end
end
        #method to edit
     def edit
            @post = Post.find(params[:id])
     end

        #method to update
     def update
            @post = Post.find(params[:id])  

              if(@post.update(post_params))

          redirect_to @post

    else 
    	render 'edit'

	end

     end 

      #method to delete
     def destroy 
     	 @post = Post.find(params[:id])
     	 @post.destroy

     	 
     	 redirect_to posts_path

     end




    #method to define the special fields a post must have
	private def post_params
       params.require(:post).permit(:title, :body)
    end
end
