defmodule PluralsightTweet.FileReaderTest do
  use ExUnit.Case
  import PluralsightTweet.FileReader

  test "Passing a file should return a string" do
    str =
      get_strings_to_tweet(
        Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "sample.txt")
      )

    assert str != nil
  end

  test "Will not return a string longer than 140 characters" do
    str =
      get_strings_to_tweet(
        Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "/test/too_long.txt")
      )

    assert str == "Short line"
  end

  test "Empty string should return an empty string" do
    str =
      get_strings_to_tweet(
        Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "/test/empty.txt")
      )

    assert str == ""
  end
end
