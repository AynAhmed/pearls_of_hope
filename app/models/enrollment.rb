# app/models/enrollment.rb
class Enrollment < ApplicationRecord
    belongs_to :student
    belongs_to :program
  end