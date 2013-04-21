  class SuggestionsController < ApplicationController
  # GET /suggestions
  # GET /suggestions.json
  before_filter :load_suggestion, :only => [:show, :edit, :update, :destroy]

  def load_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  def index
   
    @suggestions = Suggestion.all
    #Delete this code if it's clear that votes are getting set to 0 when suggestion
    #is created
    # @suggestions.each do |suggestion| 
    #   (suggestion.votes == nil ? suggestion.votes = 0 : suggestion.votes) 
    #   suggestion.save
    # end

  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
    #@suggestion = Suggestion.find(params[:id])
    @comment = Comment.new
  end

  # GET /suggestions/new
  # GET /suggestions/new.json
  def new
    @suggestion = Suggestion.new
  end

  # GET /suggestions/1/edit
  def edit
   
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(params[:suggestion])
    @suggestion.votes = 0;
    @suggestion.user_id = session[:user_id]
    @suggestion.save
    redirect_to suggestions_path
  end

  # PUT /suggestions/1
  # PUT /suggestions/1.json
  def update
    #@suggestion = Suggestion.find(params[:id])
    @suggestion.update_attributes(params[:suggestion])
    redirect_to suggestions_path, notice: 'Parapluie was successfully updated.'
  end

  def destroy
    @suggestion.destroy
    redirect_to suggestions_path 
  end

  #currently a post, but maybe make a PUT? 
  def vote
    suggestion = Suggestion.find(params[:suggestion][:id])
    suggestion.votes += 1
    suggestion.save
    redirect_to suggestions_path
  end

  def make_call
    #suggestion_id gets passed to here when "Call Suggester" gets pressed
    #employee_id associated with suggestion is looked up
    #employee phone number associated with id is looked up and passed to twilio call page
  end


end
