ActiveAdmin.register Program do
  permit_params :name, :description, :program_type, :age_group, :date,  :fee, :price


  index do
    selectable_column
    id_column
    column :name
     # Shortened description column
    column "Description" do |program|
      # Shorten the description to 50 characters and add ellipsis
      shortened_description = program.description.truncate(50, separator: ' ', omission: '...')
      # Create a span with a title attribute for tooltip
      span shortened_description, title: program.description
    end
    column :program_type
    column :age_group
    column :date
    column :fee
    column :price
    # Add other columns as needed
    actions
  end
  filter :name
  filter :description
  filter :age_group
  filter :fee
  filter :date
  filter :program_type
  # Add other filters as needed
  form do |f|
    f.inputs do
      f.input :name
      f.input :program_type
      f.input :age_group
      f.input :date
      f.input :fee, as: :select, collection: [["Yes", true], ["No", false]], include_blank: false, prompt: "Select True or False"
      f.input :price, as: :number
      f.input :description, as: :text  # Textarea for longer descriptions
    end
    f.actions
  end



  controller do
    def create
      super do |format|
        if resource.valid?
          create_stripe_product(resource)
        end
      end
    end
  
    private
  
    def create_stripe_product(program)
      stripe_secret_key = ENV['STRIPE_SECRET_KEY']
      return unless program.stripe_product_id.nil?
  
      Stripe.api_key = stripe_secret_key
  
      stripe_product = Stripe::Product.create(
        name: program.name,
        type: 'service',
        description: program.description
      )
  
      stripe_price = Stripe::Price.create(
        product: stripe_product.id,
        unit_amount: (program.price * 100).to_i, # Convert price to cents
        currency: 'usd'
      )
  
      program.update(stripe_product_id: stripe_product.id, stripe_price_id: stripe_price.id)
    end
  end
  
  
end