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
    def create_resource(object)
      super
      # After the program is created, call the StripeService to create the corresponding product
      StripeService.create_product(object)
    end
  end


  # controller do
  #   after_create do
  #     return unless resource.stripe_product_id.nil?

  #     stripe_product = Stripe::Product.create(
  #       name: resource.name,
  #       type: 'service',
  #       description: resource.description
  #     )

  #     stripe_price = Stripe::Price.create(
  #       product: stripe_product.id,
  #       unit_amount: (resource.price/100).to_i,
  #       currency: 'usd'
  #       )

  #     resource.update(stripe_product_id: stripe_product.id, stripe_price_id: stripe_price.id)
  #   end
  # end

end