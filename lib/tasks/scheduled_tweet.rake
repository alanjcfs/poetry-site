require 'securerandom'

desc 'twitter tweet'
task tweet: :environment do
  Twitter.configure do |config|
    config.consumer_key = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
    config.oauth_token = ENV['OAUTH_TOKEN']
    config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
  end
  rand = SecureRandom.random_number(Poem.count)
  poem = Poem.find(rand)

  noko = Nokogiri::HTML::Document.parse(poem.text)
  text = noko.xpath('//p').inner_html
  array = text.split("<br><br>")

  begin
    array.each do |stanza|
      stanza = stanza.gsub(/<br>/, "")
      if stanza.size < 140
        Twitter.update(stanza)
        sleep 60;
      else
        split_stanza = stanza.split("\n")
        split_stanza.inject('') do |tweet, line|
          tweet_line = tweet + "\n" + line
          if tweet_line.size >= 130
            Twitter.update(tweet)
            sleep 60;
            line
          else
            tweet_line
          end
        end
      end
    end
  rescue => e
    logger.error e
  end
end
