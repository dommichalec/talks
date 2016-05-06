class Talk < ActiveRecord::Base
  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user # users are 'likers'

  validates :title, :speaker, presence: true
  validates :topic, length: { minimum: 45 }
  validates :speaker_profile, length: { minimum: 45 }
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.upcoming
    where('date >= ?', Time.now).order('date')
  end

  def spots_left
    capacity - registrations.count
  end

  def sold_out?
    spots_left.zero?
  end
end
