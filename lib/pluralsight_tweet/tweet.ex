defmodule PluralsightTweet.Tweet do
  def send(str) do
    ExTwitter.configure(:process, [
      consumer_key: "",
      consumer_secret: "",
      access_token: "",
      access_token_secret: "",
    ])

    ExTwitter.update(str)
  end
end
