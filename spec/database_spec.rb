require_relative 'spec_helper.rb'
require_relative 'database/config.rb'
require_relative '../lib/rails_object_neighbors/base_extension.rb'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "spec/database/data.sqlite3"
)
ActiveRecord::Base.logger = nil


RSpec.describe 'next()' do
    it "Должен вернуть следующий объект" do
      expect(Post.find(5)).to eql(Post.find(4).next)
    end

    it "Должен вернуть nil если следующего элемента нет"
end

RSpec.describe 'previous()' do
    it "Должен вернуть предыдущий объект" do
      expect(Post.find(5)).to eql(Post.find(6).previous)
    end

    it "Должен вернуть nil если предыдущего элемента нет"
end

RSpec.describe 'last?()' do
    it "Должен вернуть истину, если элемент является последним" do
      expect(Post.find(10).last?).to be_truthy
    end

    it "Должен вернуть ложь, если элемент не является последним" do
      expect(Post.find(5).last?).to be_falsey
    end

    it "Должен выдать сообщение об ошибке, если элемент не существует"
end

RSpec.describe 'first?()' do
    it "Должен вернуть истину, если элемент является первым" do
      expect(Post.find(1).first?).to be_truthy
    end

    it "Должен вернуть ложь, если элемент не является первым" do
      expect(Post.find(5).first?).to be_falsey
    end

    it "Должен выдать сообщение об ошибке, если элемент не существует"
end

RSpec.describe 'all_before()' do
  it "Все ID должны быть меньше 5" do
    expect(Post.find(5).all_before.map { |p| p.id }).to all(be < 5)
  end
end

RSpec.describe 'all_after()' do
  it "Все ID должны быть больше 5" do
    expect(Post.find(5).all_after.map { |p| p.id }).to all(be > 5)
  end
end

RSpec.describe 'all_without()' do
  it "Количество элементв должно быть model.length - 1"
  it "Не должно быть элемента с ID 5"
end


RSpec.describe 'ActiveRecord::Base' do
  it "Должен включать все методы плагина"
end
