class DropPayTable < ActiveRecord::Migration[7.1]
  def change
    execute 'DROP TABLE IF EXISTS pay_customers CASCADE'
    execute 'DROP TABLE IF EXISTS pay_merchants CASCADE'
    execute 'DROP TABLE IF EXISTS pay_payment_methods CASCADE'
    execute 'DROP TABLE IF EXISTS pay_subscriptions CASCADE'
    execute 'DROP TABLE IF EXISTS pay_charges CASCADE'
    execute 'DROP TABLE IF EXISTS pay_webhooks CASCADE'
  end
end
