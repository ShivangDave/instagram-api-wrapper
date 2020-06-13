class ApplicationController < ActionController::API

  def refreshToken
    secret = request.headers['Auth']
    newToken = nil

    if secret != ENV['SECRET']
      newToken
    else
      res = RestClient.get("https://graph.instagram.com/refresh_access_token?grant_type=ig_refresh_token&access_token=#{ENV['token']}")
      newToken = JSON.parse(res)
    end

    newToken
  end

  def getImages

    query = 'caption,media_url,permalink'

    getPosts.map do |post|
      id = post["id"]
      media = RestClient.get("https://graph.instagram.com/#{id}?fields=#{query}&access_token=#{ENV['token']}")
      imageHash = JSON.parse(media)
      {
        url: imageHash["media_url"],
        caption: imageHash["caption"],
        permalink: imageHash["permalink"]
      }
    end
  end

  def getPosts
    res = JSON.parse(instaAuth)
    res["data"]
  end

  def getUserId
    RestClient.get("https://graph.instagram.com/me?fields=id,username&access_token=#{ENV['token']}")
  end

  def instaAuth
    RestClient.get("https://graph.instagram.com/me/media?fields=id,caption&access_token=#{ENV['token']}")
  end

end
