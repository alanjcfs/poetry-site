require 'securerandom'
require 'nokogiri'

desc 'twitter tweet'
task tweet: :environment do
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['CONSUMER_KEY']
    config.consumer_secret     = ENV['CONSUMER_SECRET']
    config.access_token        = ENV['OAUTH_TOKEN']
    config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
  end
  count = Poem.count
  rand  = SecureRandom.random_number(count)
  poem  = Poem.find(rand)

  loop do
    tweeted_poem = TweetedPoem.where(id: poem.id).first
    if tweeted_poem
      (tweeted_poem.count += 1) && tweeted_poem.save!
      if tweeted_poem.count > 1
        poem = Poem.find(SecureRandom.random_number(count))
      else
        break
      end
    else
      TweetedPoem.create!(poem_id: poem.id, count: 1)
      break
    end
  end

  noko = Nokogiri::HTML::Document.parse(poem.text.strip)
  text = noko.xpath('//p').inner_html
  array = text.split("<br><br>")

  begin
    array.each do |stanza|
      stanza = Nokogiri::HTML::Document.parse(stanza).text
      if stanza.size < 140
        client.update(stanza)
        sleep 60;
      else
        split_stanza = stanza.split("\n")
        last_stanza = split_stanza.inject('') do |tweet, line|
          tweet_line = tweet + "\n" + line
          if tweet_line.size >= 130
            client.update(tweet)
            sleep 60;
            line
          else
            tweet_line
          end
        end
        unless last_stanza.empty?
          client.update(last_stanza)
          sleep 60;
        end
      end
    end
  rescue => e
    logger.error e
  end
end
