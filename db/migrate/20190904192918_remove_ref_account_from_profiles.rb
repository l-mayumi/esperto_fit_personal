class RemoveRefAccountFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_reference :profiles, :accounts, foreign_key: true
  end
end