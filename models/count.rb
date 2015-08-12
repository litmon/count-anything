ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")

class Count < ActiveRecord::Base
  validates :name, presence: true
end
