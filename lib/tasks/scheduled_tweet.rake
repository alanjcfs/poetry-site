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

  def get_next_poem
    tweeted_poems = TweetedPoem.where("count >= 1")
    poem = Poem.where.not(id: tweeted_poems.select(:poem_id)).order("RANDOM()").first
    tweeted_poem = TweetedPoem.where(poem_id: poem.id).first_or_initialize(count: 1)

    tweeted_poem.count += 1 if !tweeted_poem.new_record?

    tweeted_poem.save!

    poem.plain_text.split("\n\n")
  end

  def current_stanza
    current_poem = Rails.cache.fetch('current-poem') { [] }

    current_poem = get_next_poem if current_poem.empty?

    current_stanza = current_poem.shift

    # Modifies current_stanza when it is bigger than 140 characters
    if current_stanza.size > 140
      splitsize = (current_stanza.length / 130.0).ceil
      split_stanza = current_stanza.split("\n")
      split_grouped = split_stanza
        .in_groups_of(split_stanza.size / splitsize)
        .map { |g| g.compact.join("\n") }

      current_poem.unshift(*split_grouped)

      current_stanza = current_poem.shift
    end

    Rails.cache.write('current-poem', current_poem)

    current_stanza
  end

  begin
    if Time.now.hour % 5 == 0
      @_current = current_stanza # Done because calling current_stanza modifies it.
      client.update(@_current)
      puts @_current
    end
  rescue => e
    Rails.logger.error e
  end
end
