class Program < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :type, presence: true
    validates :age_group, presence: true
    validates :date, presence: true

    has_many :courseworks
end
