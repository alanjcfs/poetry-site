require 'securerandom'
require 'nokogiri'

desc 'twitter tweet'
task tweet: :environment do
  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['OAUTH_TOKEN']
      config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
    end
  end

  def current_stanza
    @current_poem = Rails.cache.fetch('current-poem') { [] }

    if @current_poem.empty?
      tweeted_poems = TweetedPoem.where("count >= 1")
      poem = Poem.where.not(id: tweeted_poems.pluck(:poem_id)).order("RANDOM()").first
      tweeted_poem = TweetedPoem.where(poem_id: poem.id).first_or_initialize(count: 1)

      if !tweeted_poem.new_record?
        tweeted_poem.count += 1
      end

      tweeted_poem.save!

      @current_poem = poem.plain_text.split("\n\n")
    end

    @current_stanza = @current_poem.shift

    if @current_stanza.size > 140
      split_stanza = @current_stanza.split("\n")
      joined_stanzas = []
      tweet_line = ""
      length = split_stanza.length
      split_stanza.each.with_index do |line, idx|
        original_line = tweet_line

        tweet_line += "#{line}\n"
        if tweet_line.size > 140
          joined_stanzas << original_line
          tweet_line = line
          next
        end
        if tweet_line.size >= 130 || idx == length - 1
          joined_stanzas << tweet_line
          tweet_line = ""
        end
      end
      @current_stanza = joined_stanzas.shift
      @current_poem.unshift(*joined_stanzas)
    end

    Rails.cache.write('current-poem', @current_poem)

    return @current_stanza
  end

  begin
    # if Time.now.hour % 4 == 0
      @_current = current_stanza
      client.update(@_current)
      puts @_current
    # end
  rescue => e
    Rails.logger.error e
  end
end
