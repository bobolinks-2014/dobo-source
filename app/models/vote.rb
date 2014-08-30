class Vote < ActiveRecord::Base
  belongs_to :tally, polymorphic: true, counter_cache: true
  belongs_to :user
end
