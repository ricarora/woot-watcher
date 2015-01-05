class Request < ActiveRecord::Base
  belongs_to :user

  validates :website, :stringmatch, presence: true
end
