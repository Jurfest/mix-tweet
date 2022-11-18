import Config

config :pluralsight_tweet, PluralsightTweet.Scheduler,
  jobs: [
    {"* * * *",
     fn ->
       PluralsightTweet.FileReader.get_strings_to_tweet(
         Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "sample.txt")
       )
       |> PluralsightTweet.TweetServer.tweet()
     end}
  ]
