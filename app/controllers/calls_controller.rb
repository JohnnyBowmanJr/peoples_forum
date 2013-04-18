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
    capability.allow_client_outgoing demo_app_sid
    @token = capability.generate

    render 'new'
  end
end