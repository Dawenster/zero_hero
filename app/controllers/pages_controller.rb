class PagesController < ApplicationController
  def index
    if current_user
      header = {
        :authorization => "Bearer " + session[:token]["credentials"]["token"]
      }
      results = JSON.parse(RestClient.get "https://www.googleapis.com/gmail/v1/users/#{current_user.email}/messages?q=label:inbox", header )
      @count = results["messages"].map { |message| message["threadId"] }.uniq.count
    end
  end
end