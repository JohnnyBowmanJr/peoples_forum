class CallsController < ApplicationController

	def index

	end

	#makes a call from within the browser
	def new
    # Find these values at twilio.com/user/account
    account_sid = 'AC3ecb799e792404580fe5e903b88d3929'
    auth_token = 'd5ee548232ded22642dfe296d46df3af'
    # This application sid will play a Welcome Message.
    demo_app_sid = 'APabe7650f654fc34655fc81ae71caa3ff'
    capability = Twilio::Util::Capability.new account_sid, auth_token
    # Create an application sid at twilio.com/user/account/apps and use it here
    capability.allow_client_outgoing "AP98a8eee872cb3b65ba607b4a1d4980a2"
    capability.allow_client_incoming "johnny"
    @token = capability.generate

    render 'new'
  end

  def voice 
    response = Twilio::TwiML::Response.new do |r|
        # Should be your Twilio Number or a verified Caller ID
        r.Dial :callerId => '+13108041305' do |d|
            d.Client 'johnny'
        end
    end
    response.text
	end

end