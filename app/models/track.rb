class Track < ActiveRecord::Base
    
    belongs_to :trackable, :polymorphic => true
    
    def mark_sent
        self.update(:sent => 1, :count => 0)
    end
    
    def self.add_comment(trackable)
        self.where(trackable_id: trackable.id, trackable_type: trackable.class.downcase).update_all(count: count+1, sent:0)
    end
    
end
