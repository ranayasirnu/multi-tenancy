class Repository < ApplicationRecord
  belongs_to :user


  validates :name, :presence => {:message => "can't be blank"}
  validates :access_level, :presence => {:message => "can't be blank"}
  validates :description, :presence => {:message => "can't be blank"}


end
