class AddHostToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :host, foreign_key: { to_table: :users }
  end
end
