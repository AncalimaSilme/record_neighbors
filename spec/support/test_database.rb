require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)

class Post < ActiveRecord::Base
  scope :on_position, -> { order(position: :asc) }
end

ActiveRecord::Schema.define do
  create_table :posts do |t|
    t.column :position, :indeger
  end
end

[2, 3, 1, 10, 9, 6, 5, 7, 8, 4].each_with_index do |position, index|
  Post.create!(position: position)
end
