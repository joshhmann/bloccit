require 'random_data'

# Create Posts
50.times do
    
    # 1 
  Post.create!(
    
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
    )
end
posts = Post.all

# create comments

100.times do
  Comment.create!(
    
      post: posts.sample,
      body: RandomData.random_paragraph
    )
  end
  
  puts "#{Post.count}"
  Post.find_or_create_by(title: "A unique title", body: "A unique body")
  puts "#{Post.count}"
  
  puts "#{Comment.count}"
  Comment.find_or_create_by(body: "A unique comment")
  puts "#{Comment.count}"
  
  puts "Seed finished"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
  
  