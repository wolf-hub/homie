class ChangeCreditScoreToBeStringInTenants < ActiveRecord::Migration[5.2]
  def change
  	change_column :tenants, :credit_score, :string
  end
end
