class Writing < ActiveRecord::Base
  default_scope -> {order(:published_on => :desc)}
end
