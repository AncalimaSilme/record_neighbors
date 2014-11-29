require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)

class Post < ActiveRecord::Base
end

ActiveRecord::Schema.define do
  create_table :posts do |t|
    t.column :title, :string
    t.column :body, :text
  end
end

10.times do |index|
  Post.create!(
    title: "post title #{index + 1}",
    body: "post body #{index + 1}"
    )
end
