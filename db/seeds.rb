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
  
  100.times do
    Question.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      resolved: false
    )
  end
  puts "Seed finished"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
  puts "#{Question.count} questions created"