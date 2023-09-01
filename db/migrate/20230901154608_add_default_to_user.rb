class AddDefaultToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :photo, from: nil, to: 'https://placehold.co/200x200'
  end
end
