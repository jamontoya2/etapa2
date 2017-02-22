#index
get '/post' do
  erb :new_post
end

get '/post/search' do
  erb :search_posts
end

#create
post '/posts' do
	@post = Post.create(title: params[:title], body: params[:body])
		#p "*" * 50
  if @post.valid? 
		params[:tags].gsub(/\s/, '').split(",").each do |tag|
    	if Tag.verificate(tag) != nil
   	  	PostTag.create(post_id: @post.id, tag_id: Tag.verificate(tag).id)
      else
        tags = Tag.create(name: tag)
       	PostTag.create(post_id: @post.id, tag_id: tags.id)
      end
    end 
  redirect to ('/')
  else
     	erb :new_post 
  end
end

#show
get '/posts/:id' do
	@post = Post.find(params[:id])
	@tags = @post.tags

  erb :show_posts
end

#edit enviar
get '/posts/edit/:id' do
	@post = Post.find(params[:id])
	@tags = @post.tags
	erb :edit_posts
end


# edit recibe
put '/posts/:id' do
array = Array.new 	
post = Post.find(params[:id])
tags = post.tags
  
  tags.each do |item|
  	array << item.name
  end	

  answer = (params[:tags].gsub(/\s/, '').split(",").uniq.sort == array.uniq.sort) ? true : false
  
  if answer == false
  	post_tag = PostTag.where(tag_id: tags.ids)
  	post_tag.destroy_all
  		params[:tags].gsub(/\s/, '').split(",").each do |tag|
    	if Tag.verificate(tag) != nil
   	  	PostTag.create(post_id: post.id, tag_id: Tag.verificate(tag).id)
      else
        tags = Tag.create(name: tag)
       	PostTag.create(post_id: post.id, tag_id: tags.id)
      end
    end 	
  end
	post.update(params[:post])
  redirect to ('/')
 end

#delete
get '/posts/delete/:id' do
  post = Post.all.find(params[:id])
  post_tag = PostTag.where(post_id: post.id)
  post.destroy
  post_tag.destroy_all
  redirect to ('/')
end

#search post
post '/posts/search' do
  @post = Post.where("title LIKE :query", query: "%#{params[:title]}%")
  @message = "posts ##{params[:title]}"
  erb :search_posts
end


