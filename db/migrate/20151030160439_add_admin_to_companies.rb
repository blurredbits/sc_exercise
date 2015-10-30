class AddAdminToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :admin, index: true
    add_foreign_key :companies, :users, column: :admin_id
  end
end
