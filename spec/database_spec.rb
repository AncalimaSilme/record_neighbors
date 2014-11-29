require_relative 'spec_helper.rb'
require_relative 'support/database_config.rb'
require_relative '../lib/rails_object_neighbors/base_extension.rb'

RSpec.describe 'next()' do
    it "Должен вернуть следующий объект" do
      expect(Post.find(5)).to eql(Post.find(4).next)
    end

    it "Должен вернуть nil если следующего элемента нет" do
      expect(Post.find(10).next).to be_nil
    end
end

RSpec.describe 'previous()' do
    it "Должен вернуть предыдущий объект" do
      expect(Post.find(5)).to eql(Post.find(6).previous)
    end

    it "Должен вернуть nil если предыдущего элемента нет" do
      expect(Post.find(1).previous).to be_nil
    end
end

RSpec.describe 'last?()' do
    it "Должен вернуть истину, если элемент является последним" do
      expect(Post.find(10).last?).to be_truthy
    end

    it "Должен вернуть ложь, если элемент не является последним" do
      expect(Post.find(5).last?).to be_falsey
    end
end

RSpec.describe 'first?()' do
    it "Должен вернуть истину, если элемент является первым" do
      expect(Post.find(1).first?).to be_truthy
    end

    it "Должен вернуть ложь, если элемент не является первым" do
      expect(Post.find(5).first?).to be_falsey
    end
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
  it "Количество элементв должно быть model.length - 1" do
    expect(Post.find(5).all_without.size).to eql(Post.all.size - 1)
  end

  it "В результате не должно быть объекта с ID 5" do
    expect(Post.find(5).all_without).to_not include(Post.find(5))
  end
end


RSpec.describe ActiveRecord::Base do
  it "Должен включать все методы плагина" do
    expect(ActiveRecord::Base.instance_methods).to include(:next, :previous, :first?, :last?, :all_before, :all_after, :all_without)
  end
end
