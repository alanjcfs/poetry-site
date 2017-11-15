class PostgresCacheStore < ActiveSupport::Cache::Store
  def read_entry(key, options)
    cache = Cache.find_by(key: key.to_json)
    cache.entry if cache
  end

  def write_entry(key, entry, options)
    cache = Cache.where(key: key.to_json).first_or_initialize
    cache.data = entry.as_json
    cache.options = options.as_json
    cache.save!
    cache.entry
  end

  def delete_entry(key, options)
    read_entry(key)
    cache.destroy!
    cache.data
  end

  def delete_matched(matcher, options = nil) # Optional
    super
  end

  def increment(name, amount = 1, options = nil) # Optional
    read_entry
    cache.data += amount
    cache.save!
  end

  def decrement(name, amount = 1, options = nil) # Optional
    read_entry
    cache.data -= amount
    cache.save!
  end

  def cleanup(options = nil) # Optional
    super
  end

  def clear(options = nil) # Optional
    super
  end
end
