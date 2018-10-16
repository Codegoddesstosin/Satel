class CommentsController < ApplicationController
# basic auth
http_basic_authenticate_with name: "Tosin", password: "secret", only: [:destroy]
	
	#method to create a comment
	def create 
           @post = Post.find(params[:post_id])
           @comment = @post.comments.create(comment_params)
           redirect_to post_path(@post)
	end
     
     #comment method
	private def comment_params
	  params.require(:comment).permit(:username, :body)
end

 #method to delete comment
 def destroy
 	@post = Post.find(params[:post_id])
 	@comment = @post.comments.find(params[:id])
 	@comment.destroy
 	redirect_to post_path(@post)

 end

end