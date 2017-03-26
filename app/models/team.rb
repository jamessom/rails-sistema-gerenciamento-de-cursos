class Team < ActiveRecord::Base
  belongs_to :Trainer
  belongs_to :Course
end
