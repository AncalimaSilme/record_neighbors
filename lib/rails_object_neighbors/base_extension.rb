require 'active_support/concern'

module BaseExtension
  extend ActiveSupport::Concern

  def last?
    self == self.class.last
  end

  def first?
    self == self.class.first
  end

  def next
    self.class.where("id > #{self.id}").order(id: :asc).limit(1).first
  end

  def previous
    self.class.where("id < #{self.id}").order(id: :desc).limit(1).first
  end

  def all_after
    self.class.where("id > #{self.id}")
  end

  def all_before
    self.class.where("id < #{self.id}")
  end

  def all_without
    self.class.where.not(id: self.id)
  end

  ActiveRecord::Base.send(:include, BaseExtension)
end
