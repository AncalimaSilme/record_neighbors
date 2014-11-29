require_relative 'spec_helper.rb'
require_relative 'support/test_database.rb'
require_relative '../lib/record_neighbors/base_extension.rb'


# post title 1 - 2
# post title 2 - 3
# post title 3 - 1
# post title 4 - 10
# post title 5 - 9
# post title 6 - 6
# post title 7 - 5
# post title 8 - 7
# post title 9 - 8
# post title 10 - 4


RSpec.describe 'next()' do
    it "Должен вернуть следующий объект" do
      expect(Post.find(5)).to eql(Post.find(4).next)
    end

    it "Должен вернуть nil если следующего элемента нет" do
      expect(Post.find(10).next).to be_nil
    end

    it "Должен вернуть следующий объект из отсортированного списка по переданному атрибуту" do
      expect(Post.find(7).next('position')).to eql(Post.find(6))
    end
end

RSpec.describe 'previous()' do
    it "Должен вернуть предыдущий объект" do
      expect(Post.find(5)).to eql(Post.find(6).previous)
    end

    it "Должен вернуть nil если предыдущего элемента нет" do
      expect(Post.find(1).previous).to be_nil
    end

    it "Должен вернуть предыдущий объект из отсортированного списка по переданному атрибуту" do
      expect(Post.find(7).previous('position')).to eql(Post.find(10))
    end
end

RSpec.describe 'last?()' do
    it "Должен вернуть истину, если объект является последним" do
      expect(Post.find(10).last?).to be_truthy
    end

    it "Должен вернуть ложь, если объект не является последним" do
      expect(Post.find(5).last?).to be_falsey
    end

    it "Должен вернуть истину, если объект является последним в отсортированном, по атрибуту, списке" do
      expect(Post.find(4).last?('position')).to be_truthy
    end

    it "Должен вернуть ложь, если объект не является последним в отсортированном, по атрибуту, списке" do
      expect(Post.find(10).last?('position')).to be_falsey
    end
end

RSpec.describe 'first?()' do
    it "Должен вернуть истину, если объект является первым" do
      expect(Post.find(1).first?).to be_truthy
    end

    it "Должен вернуть ложь, если объект не является первым" do
      expect(Post.find(5).first?).to be_falsey
    end

    it "Должен вернуть истину, если объект является первым в отсортированном, по атрибуту, списке" do
      expect(Post.find(3).first?('position')).to be_truthy
    end

    it "Должен вернуть ложь, если объект не является первым в отсортированном, по атрибуту, списке" do
      expect(Post.find(1).first?('position')).to be_falsey
    end
end

RSpec.describe 'all_before()' do
  it "Все ID должны быть меньше 5" do
    expect(Post.find(5).all_before.map { |p| p.id }).to all(be < 5)
  end

  it "Все Position должны быть меньше 5" do
    expect(Post.find_by(position: 5).all_before('position').map { |p| p.position }).to all(be < 5)
  end
end

RSpec.describe 'all_after()' do
  it "Все ID должны быть больше 5" do
    expect(Post.find(5).all_after.map { |p| p.id }).to all(be > 5)
  end

  it "Все Position должны быть больше 5" do
    expect(Post.find_by(position: 5).all_after('position').map { |p| p.position }).to all(be > 5)
  end
end

RSpec.describe 'all_without()' do
  it "Количество элементв должно быть model.length - 1" do
    expect(Post.find(5).all_without.size).to eql(Post.all.size - 1)
  end

  it "В результате не должно быть объекта с ID == 5" do
    expect(Post.find(5).all_without).to_not include(Post.find(5))
  end
end


RSpec.describe ActiveRecord::Base do
  it "Должен включать все методы плагина" do
    expect(ActiveRecord::Base.instance_methods).to include(:next, :previous, :first?, :last?, :all_before, :all_after, :all_without)
  end
end
