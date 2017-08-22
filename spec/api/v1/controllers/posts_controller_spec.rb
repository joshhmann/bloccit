require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }
  let(:my_post) { create(:post, topic: my_topic, user: my_user) }
  
  context "unauthenticated user" do
    
     it "PUT update returns http unauthenticated" do
       put :update, id: my_post.id, topic: {title: "my post", body: "post description"}
       expect(response).to have_http_status(401)
     end
 
     it "POST create returns http unauthenticated" do
       post :create, post: {title: "Topic Name", body: "Topic Description"}
       expect(response).to have_http_status(401)
     end
 
     it "DELETE destroy returns http unauthenticated" do
       delete :destroy, id: my_post.id
       expect(response).to have_http_status(401)
     end
   end

   context "unauthorized user" do
     it "PUT update returns http forbidden" do
       put :update, id: my_post.id, post: {title: "Topic Name", body: "Topic Description"}
       expect(response).to have_http_status(403)
     end
 
     it "POST create returns http forbidden" do
       post :create, post: {title: "Topic Name", body: "Topic Description"}
       expect(response).to have_http_status(403)
     end
 
     it "DELETE destroy returns http forbidden" do
       delete :destroy, id: my_post.id
       expect(response).to have_http_status(403)
     end
  end
end