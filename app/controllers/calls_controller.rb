class CallsController < ApplicationController

	# put your default Twilio Client name here, for when a phone number isn't given


	def index

	end

	#makes a call from within the browser
	def new
    # Find these values at twilio.com/user/account
    default_client = "jenny"
    account_sid = 'AC3ecb799e792404580fe5e903b88d3929'
    auth_token = 'd5ee548232ded22642dfe296d46df3af'
  
    capability = Twilio::Util::Capability.new account_sid, auth_token
    # Create an application sid at twilio.com/user/account/apps and use it here
    capability.allow_client_outgoing "AP98a8eee872cb3b65ba607b4a1d4980a2"
    capability.allow_client_incoming default_client
    @token = capability.generate

    render 'new'
  end

  # Add a Twilio phone number or number verified with Twilio as the caller ID
	

  def voice 
    caller_id = '+13109075542'
    number = params[:PhoneNumber]
    response = Twilio::TwiML::Response.new do |r|
      # Should be your Twilio Number or a verified Caller ID
      # Should be your Twilio Number or a verified Caller ID
      r.Dial :callerId => caller_id do |d|
        # Test to see if the PhoneNumber is a number, or a Client ID. In
        # this case, we detect a Client ID by the presence of non-numbers
        # in the PhoneNumber parameter.
        if /^[\d\+\-\(\) ]+$/.match(number)
            d.Number(CGI::escapeHTML number)
        else
            d.Client @default_client
        end
      end	
    end
   	render :xml => response.text
	end

end