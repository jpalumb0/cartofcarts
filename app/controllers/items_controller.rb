class ItemsController < ApplicationController
  def index
    @q = current_user.items.ransack(params[:q])
      @items = @q.result(:distinct => true).includes(:user, :vendor).page(params[:page]).per(10)

    render("items/index.html.erb")
  end

  def show
    @item = Item.find(params[:id])

    render("items/show.html.erb")
  end

  def new
    @item = Item.new

    render("items/new.html.erb")
  end

  def create
    @item = Item.new

    @item.item_name = params[:item_name]
    @item.description = params[:description]
    @item.quantity_wanted = params[:quantity_wanted]
    @item.quantity_received = params[:quantity_received]
    @item.item_url = params[:item_url]
    @item.vendor_id = params[:vendor_id]
    @item.image_url = params[:image_url]
    @item.user_id = params[:user_id]

    save_status = @item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/items/new", "/create_item"
        redirect_to("/items")
      else
        redirect_back(:fallback_location => "/", :notice => "Item created successfully.")
      end
    else
      render("items/new.html.erb")
    end
  end

  def edit
    @item = Item.find(params[:id])

    render("items/edit.html.erb")
  end

  def update
    @item = Item.find(params[:id])

    @item.item_name = params[:item_name]
    @item.description = params[:description]
    @item.quantity_wanted = params[:quantity_wanted]
    @item.quantity_received = params[:quantity_received]
    @item.item_url = params[:item_url]
    @item.vendor_id = params[:vendor_id]
    @item.image_url = params[:image_url]
    @item.user_id = params[:user_id]

    save_status = @item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/items/#{@item.id}/edit", "/update_item"
        redirect_to("/items/#{@item.id}", :notice => "Item updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Item updated successfully.")
      end
    else
      render("items/edit.html.erb")
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    if URI(request.referer).path == "/items/#{@item.id}"
      redirect_to("/", :notice => "Item deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Item deleted.")
    end
  end
end
