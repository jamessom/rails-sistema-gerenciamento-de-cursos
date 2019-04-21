class Team < ApplicationRecord
  belongs_to :Trainer
  belongs_to :Course
end
