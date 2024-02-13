# app/models/payment.rb
class Payment < ApplicationRecord
    belongs_to :user
    # Your model code goes here
    after_create :create_enrollments_for_programs

  private

  def create_enrollments_for_programs
    return if program_ids.blank?

    programs = program_ids.split(',').map(&:to_i)
    programs.each do |program_id|
      Enrollment.create(program_id: program_id, user_id: user_id)
    end
  end
  end
  
  