class Admin::ItemsController < ApplicationController
before_action :require_admin
  def index
    @items = Item.all
  end
	
	def edit
	end

	private
	def require_admin
		render file: "/public/404" unless current_admin?
	end
end