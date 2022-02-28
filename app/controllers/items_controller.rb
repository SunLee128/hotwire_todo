class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  attr_accessor :completed

  # GET /items or /items.json
  def index
    @item = Item.new
    @items = Item.all
    @completed_count = @items.filter(&:completed).count
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @items = Item.all

    respond_to do |format|
      if @item.save
        format.turbo_stream { render :create }
        format.html { redirect_to items_url }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @item = Item.find(params[:id])
    @item.update item_params
    @item.save
    @items = Item.all
    @completed_count = @items.filter(&:completed).count
    respond_to do |format|
      if @item.save
        format.turbo_stream { render :update }
        format.html { redirect_to items_url}
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    @items = Item.all
    @completed_count = @items.filter(&:completed).count

    respond_to do |format|
      format.turbo_stream { render :destroy }
      format.html { redirect_to items_url }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:description, :completed)
  end
end
