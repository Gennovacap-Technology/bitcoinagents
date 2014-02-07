class AddMoreFieldsToUserTable < ActiveRecord::Migration
	def change
		add_column :users, :phone, :string
		add_column :users, :country_id, :integer
		add_column :users, :account, :string
	end
end
