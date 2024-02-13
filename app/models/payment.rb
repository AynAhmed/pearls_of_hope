# app/models/payment.rb
class Payment < ApplicationRecord
    belongs_to :user

    
    after_create do
      payment = Payment.last
      programs = payment.program_ids.split(',').map(&:to_i)
      programs.each do |program_id|
        Enrollment.create(user_id: payment.user_id, program_id:)
      end
    end
    
  end
  