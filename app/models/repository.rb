class Repository < ApplicationRecord
  
  validates :name, :presence => {:message => "can't be blank"}
  validates :access_level, :presence => {:message => "can't be blank"}
  validates :description, :presence => {:message => "can't be blank"}


end
