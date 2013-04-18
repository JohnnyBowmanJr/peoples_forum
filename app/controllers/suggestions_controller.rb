class SuggestionsController < ApplicationController
  # GET /suggestions
  # GET /suggestions.json
  

  def index
    @suggestions = Suggestion.all
    @suggestions.each do |suggestion| 
      (suggestion.votes == nil ? suggestion.votes = 0 : suggestion.votes) 
      suggestion.save
    end

  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
    @suggestion = Suggestion.find(params[:id])
    @comment = Comment.new
    #make comment associated with @suggestions
  end

  # GET /suggestions/new
  # GET /suggestions/new.json
  def new
    @suggestion = Suggestion.new
  end

  # GET /suggestions/1/edit
  def edit
    @suggestion = Suggestion.find(params[:id])
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(params[:suggestion])
    @suggestion.votes = 0;
    @suggestion.save
    redirect_to suggestions_path
  end

  # PUT /suggestions/1
  # PUT /suggestions/1.json
  def update
    @suggestion = Suggestion.find(params[:id])
    @suggestion.update_attributes(params[:suggestion])    
  end

  #currently a post, but maybe make a PUT? 
  def vote
    suggestion = Suggestion.find(params[:suggestion][:id])
    suggestion.votes += 1
    suggestion.save
    redirect_to suggestions_path
  end


end
