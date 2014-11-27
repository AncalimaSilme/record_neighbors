require 'active_support/concern'

module BaseExtension
  extend ActiveSupport::Concern

  def last?(attribute = "id")
    self == self.class.order("#{attribute} ASC").last
  end

  def first?(attribute = "id")
    self == self.class.order("#{attribute} ASC").first
  end

  def next(attribute = "id")
    self.class.where("#{attribute} > #{self.send(attribute)}").order("#{attribute} ASC").limit(1).first
  end

  def previous(attribute = "id")
    self.class.where("#{attribute} < #{self.send(attribute)}").order("#{attribute} DESC").limit(1).first
  end

  def all_after(attribute = "id")
    self.class.where("#{attribute} > #{self.send(attribute)}").order("#{attribute} ASC")
  end

  def all_before(attribute = "id")
    self.class.where("#{attribute} < #{self.send(attribute)}").order("#{attribute} ASC")
  end

  def all_without(attribute = "id")
    self.class.where.not(id: self.id).order("#{attribute} ASC")
  end

  ActiveRecord::Base.send(:include, BaseExtension)
end
