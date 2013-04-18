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

# PUT 
  def vote
    suggestion = Suggestion.find(params[:suggestion][:id])
    suggestion.votes += 1
    suggestion.save
    redirect_to suggestions_path
  end

   def call
       # put your own credentials here - from twilio.com/user/account
    
    account_sid = 'AC582454da60c53d2660fbff36042656e6'
    auth_token = 'fa4e593e6e396ecbac9d3fd33eba7b2f'
 
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
 
    @call = @client.account.calls.create(
    :from => '+13109075542',   # From your Twilio number
    :to => '+13108041305',     # To any number
    # Fetch instructions from this URL when the call connects
    :url => 'https://demo.twilio.com/welcome/voice/'
    )
    redirect '/'
  end
end
