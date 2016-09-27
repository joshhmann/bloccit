require 'random_data'

15.times do 
  Topic.create!(
    name:        RandomData.random_sentence,
    description: RandomData.random_paragraph
    )
  end
  topics = Topic.all



# Create Posts
50.times do
    
    # 1 
  Post.create!(
      topic: topics.sample,
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
  
  50.times do
    
    # 1 
  SponsoredPost.create!(
      topic: topics.sample,
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      price: 100
    )
end
posts = SponsoredPost.all
  
  puts "Seed finished"
  puts "#{Topic.count} topics created"
  puts "#{Post.count} posts created"
  puts "#{SponsoredPost.count} sponsored posts created"
  puts "#{Comment.count} comments created"
  