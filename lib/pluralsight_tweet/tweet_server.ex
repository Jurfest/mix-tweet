defmodule PluralsightTweet.TweetServer do
  # GenServer (generic server). GenServers are behaviors, i.e:
  # - Define a set of functions to be implemented
  # - Ensure that a module implements ALL functions in that set
  use GenServer

  def start_link(_) do
    # __Module__ is commonly called dunder module
    GenServer.start_link(__MODULE__, :ok, name: :tweet_server)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:tweet, tweet}, _) do
    PluralsightTweet.Tweet.send(tweet)
    {:noreply, %{}}
  end

  def tweet(tweet) do
    GenServer.cast(:tweet_server, {:tweet, tweet})
  end

end
