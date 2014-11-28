require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "data.sqlite3"
)

# Ошибки работы с БД направим в стандартный поток (консоль)
ActiveRecord::Base.logger = Logger.new(STDERR)


class Post < ActiveRecord::Base
end
