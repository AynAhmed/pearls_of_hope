# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @products = current_user.products
  end
end
