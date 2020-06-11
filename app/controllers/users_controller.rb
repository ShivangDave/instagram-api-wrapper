class UsersController < ApplicationController

  def auth
    puts params
    render :json => { "msg" => "this is auth" }, :status => :ok
  end

  def deauth
    puts params
    render :json => { "msg" => "this is deauth" }, :status => :ok
  end

  def pictures
    puts params
    render :json => { "msg" => "this is pictures" }, :status => :ok
  end

end
