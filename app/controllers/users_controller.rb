class UsersController < ApplicationController

  def welcome
    render :json => { "msg" => "Welcome to this app" }, :status => :ok
  end

  def auth
    render :json => { "msg" => "you're not supposed to be here!" }, :status => :ok
  end

  def deauth
    render :json => { "msg" => "you're not supposed to be here either!" }, :status => :ok
  end

  def refresh
    res = refreshToken
    
    if res
      render :json => { "token" => res }
    else
      render :json => { "token" => "failed" }
    end
  end

  def pictures
    pictures = getImages
    render :json => pictures.to_json, :status => :ok
  end

end
