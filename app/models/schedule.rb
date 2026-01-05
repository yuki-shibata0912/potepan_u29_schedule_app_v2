class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :memo, length: { maximum: 500 }

  validate :end_at_must_be_on_or_after_start_at

  private

  def end_at_must_be_on_or_after_start_at
    return if start_at.blank? || end_at.blank?

    if end_at < start_at
      errors.add(:end_at, "は開始日以降の日付にしてください")
    end
  end
end