class AddStatutToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :statut, :string, :default => "Pending"
  end
end
