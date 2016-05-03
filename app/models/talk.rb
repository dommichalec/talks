class Talk < ActiveRecord::Base

  def self.upcoming
    where('date >= ?', Time.now).order('date')
  end
end
