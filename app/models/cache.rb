class Cache < ActiveRecord::Base
  def entry
    d = read_attribute('data')
    ActiveSupport::Cache::Entry.new(d.delete('value'), d.symbolize_keys)
  end
end
