class InventoriesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_inventory, only: [:destroy]

  def index
    @inventories = Inventory.includes(:inventory_foods).where(user_id: current_user.id)
  end

  def new
    @inventory = Inventory.new
    @foods = Food.all # Fetch a collection of all food items
    @inventory_food = InventoryFood.new
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def create
    @inventory = current_user.inventories.build(inventory_params)
    if @inventory.save
      flash[:notice] = 'Inventory created successfully.'
      redirect_to inventories_path
    else
      flash.now[:alert] = 'Inventory creation failed.'
      render :new # Render the 'new' view to show validation errors and preserve form data
    end
  end

  def destroy
    if can_manage_inventory?(@inventory)
      if @inventory.destroy
        flash[:notice] = 'Inventory deleted successfully.'
      else
        flash[:alert] = 'Error deleting the inventory.'
      end
    else
      flash[:alert] = 'You do not have permission to delete this inventory.'
    end

    redirect_to inventories_path
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end

  def can_manage_inventory?(inventory)
    inventory.user == current_user
  end
end
