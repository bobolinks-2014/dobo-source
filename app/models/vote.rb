class Vote < ActiveRecord::Base
  belongs_to :tally, polymorphic: true
end
