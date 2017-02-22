post = Post.create(title:"hola", body:"como estas")
tag1 = Tag.create(name: "adios")
tag2 = Tag.create(name: "hasta la vista")
posttag = PostTag.create(post_id: post.id, tag_id: tag1.id)
posttag = PostTag.create(post_id: post.id, tag_id: tag2.id)

