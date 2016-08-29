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
  
  puts "Seed finished"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
  
  # Create Advertisement
50.times do
    
    # 1 
  Advertisement.create!(
    
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      price: RandomData.random_numbers
    )
end
posts = Advertisement.all

  
  puts "Seed finished"
  puts "#{Advertisement.count} Advertisements created"

