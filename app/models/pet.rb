class Pet < ApplicationRecord
  # associations
  # validations
  validates :address, presence: true
  validates :found_on, presence: true
  SPECIES = ['cat', 'dog', 'snake', 'pigeon', 'hamster', 'zebra']
  validates :species, inclusion: { in: SPECIES }
end
