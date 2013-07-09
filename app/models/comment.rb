class Comment < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :commentable, :polymorphic => true
    
    after_create :new_comment
    
    def self.search(search_string)
    end
    
    private 
    
    def new_comment
        self.commentable.tracks.update_all(:sent => 0, :count => count + 1)
    end
    
end
