class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end
  
  def show 
    @topic = Topic.find(params[:id])
  end
  
  def new
    @topic = Topic.new
  end
  
  
  def create
     @topic = Topic.new
     @topic.name = params[:topic][:name]
     @topic.description = params[:topic][:description]
     @topic.public = params[:topic][:public]
 
     if @topic.save
       flash[:notice] = "Topic was saved successfully."
       redirect_to @topic
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
  end
   
  def edit
     @topic = Topic.find(params[:id])
  end
  def update
     @topic = Topic.find(params[:id])
 
     @topic.name = params[:topic][:name]
     @topic.description = params[:topic][:description]
     @topic.public = params[:topic][:public]
 
     if @topic.save
        flash[:notice] = "Topic was updated successfully."
       redirect_to @topic
     else
       flash.now[:alert] = "Error saving topic. Please try again."
       render :edit
     end
  end
   
  def destroy
     @topic = Topic.find(params[:id])
 
     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
     end
  end
end
