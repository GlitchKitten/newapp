$redis = nil
if Rails.env.development?
  $redis = Redis.new(:host => 'localhost', :port => 6379)
elsif Rails.env.production?
  uri = ENV["REDISTOGO_URL"] || "redis://localhost:6379/"
  $redis = Redis.new(:url => uri)
end   