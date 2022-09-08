# frozen_string_literal: true

class Bulletin < ApplicationRecord
  include AASM

  aasm :column => 'state' do
    state :draft, initial: true
    state :under_moderation, :published, :rejected, :archived

    event :moderate do
      transitions from: :draft, to: :under_moderation
    end

    event :publish do
      transitions from: :under_moderation, to: :published
    end

    event :reject do
      transitions from: :published, to: :rejected
    end

    event :archive do
      transitions from: %w(published draft under_moderation rejected), to: :archived
    end
    
  end

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :image, attached: true, content_type: %i[png jpg jpeg], size: { less_than: 5.megabytes }

  belongs_to :user
  belongs_to :category
  has_one_attached :image
end
