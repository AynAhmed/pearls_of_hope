class Program < ApplicationRecord
    has_many :courseworks
    has_many :enrollments
    has_one_attached :image

    validates :name, presence: true
    validates :description, presence: true
    validates :program_type, presence: true
    validates :age_group, presence: true
    validates :date, presence: true
    validates :fee, inclusion: { in: [true, false] }

    has_many :courseworks
    has_one :product, dependent: :destroy
    after_create :create_local_product
    
 
  


   def self.ransackable_attributes(auth_object = nil)
        ["age_group", "created_at", "date", "description", "id", "id_value", "name", "fee", "program_type", "updated_at"]
    end

    private

 
    def create_local_product
      product = Product.create(
        name: self.name,
        price: self.price, # Assuming 'price' attribute exists in the Program model
        program_id: self.id,
        price_id: self.stripe_price_id # Set the price_id column with stripe_price_id
      )
    end
    


    
end

