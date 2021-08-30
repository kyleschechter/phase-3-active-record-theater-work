class Role < ActiveRecord::Base
  has_many :auditions

  def self.actors
    auditions.map {|aud| aud.actor}
  end

  def self.locations
    auditions.map {|aud| aud.location}.uniq
  end

  def self.lead
    auds = auditions.where {|aud| aud.hired == true}
    auds.length > 0 ? auds[0] : "no actor was hired for this role"
  end

  def self.understudy
    auds = auditions.where {|aud| aud.hired == true}
    auds.length > 1 ? auds[1] : "no actor has been hired for understudy for this role"
  end
end