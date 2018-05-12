class Matchday < ApplicationRecord
  has_many :matches

  scope :available, -> do
    where('started_at < :now AND ended_at > :now', now: DateTime.current)
  end

  def available?
    -> (date) { started_at < date && ended_at > date }.call(DateTime.current)
  end
end
