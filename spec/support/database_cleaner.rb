require "database_cleaner"

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.allow_remote_database_url = true
    DatabaseCleaner.strategy                  = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) { |example| DatabaseCleaner.cleaning { example.run } }
end
