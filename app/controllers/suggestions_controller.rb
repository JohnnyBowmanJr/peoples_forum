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


# twilio code that calls person and reads script from XML file
  # def call
  #      # put your own credentials here - from twilio.com/user/account  
  #   account_sid = 'AC3ecb799e792404580fe5e903b88d3929'
  #   auth_token = 'd5ee548232ded22642dfe296d46df3af'
 
  #   # set up a client to talk to the Twilio REST API
  #   @client = Twilio::REST::Client.new account_sid, auth_token
 
  #   @call = @client.account.calls.create(
  #   :from => '+13109075542',   # From your Twilio number
  #   :to => '+13108041305',     # To any number
  #   # Fetch instructions from this URL when the call connects
  #   :url => 'https://demo.twilio.com/welcome/voice/'
  #   )
  #   redirect_to '/'
  # end

twilio code that calls person and reads script from XML file
  def call
    # Set our AccountSid and AuthToken
    AccountSid = "AC3ecb799e792404580fe5e903b88d3929"
    AuthToken = "d5ee548232ded22642dfe296d46df3af"
 
    :from => '+13108041305',   #Your Twilio Number or an Outgoing Caller ID you have previously validated
    with Twilio
    :to => '+16462837437',     #Number you wish to call
 
    # Directory location for callback.php file (for use in REST URL)
    $url = 'http://www.example.com/clicktocall/'
 
    # Instantiate a new Twilio Rest Client
    $client = new Services_Twilio($AccountSid, $AuthToken)
 
    if (!isset($_REQUEST['called'])) {
      $err = urlencode("Must specify your phone number")
      header("Location: index.php?msg=$err")
      die;
    }
 
    # make Twilio REST request to initiate outgoing call
    $call = $client->account->calls->create($from, $to, $url . 'callback.php?number=' . $_REQUEST['called']);
 
    # redirect back to the main page with CallSid
    $msg = urlencode("Connecting... ".$call->sid);
    header("Location: index.php?msg=$msg");

    redirect_to '/'
    end
  
end
