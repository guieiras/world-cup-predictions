class Matchday < ApplicationRecord
  has_many :matches

  scope :available, -> do
    where('started_at < :now AND ended_at > :now', now: DateTime.current)
  end
end
