namespace :poems do
  desc 'Make text plain text by stripping HTML'
  task :make_plain_text => :environment do
    Poem.find_each do |poem|
      noko = Nokogiri::HTML::Document.parse(poem.text.strip)
      text = noko.xpath('//p').inner_html
      array = text.split("<br><br>")
      plain_text = array.join("\n\n")
      poem.update_attributes(plain_text: plain_text)
    end
  end
end
