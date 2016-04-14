class RemoveConversationIdFromMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :conversation_id
  end
end
