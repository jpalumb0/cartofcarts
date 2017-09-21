class VendorsController < ApplicationController
  def index
    @vendors = Vendor.page(params[:page]).per(10)

    render("vendors/index.html.erb")
  end

  def show
    @item = Item.new
    @vendor = Vendor.find(params[:id])

    render("vendors/show.html.erb")
  end

  def new
    @vendor = Vendor.new

    render("vendors/new.html.erb")
  end

  def create
    @vendor = Vendor.new

    @vendor.vendor_name = params[:vendor_name]

    save_status = @vendor.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vendors/new", "/create_vendor"
        redirect_to("/vendors")
      else
        redirect_back(:fallback_location => "/", :notice => "Vendor created successfully.")
      end
    else
      render("vendors/new.html.erb")
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])

    render("vendors/edit.html.erb")
  end

  def update
    @vendor = Vendor.find(params[:id])

    @vendor.vendor_name = params[:vendor_name]

    save_status = @vendor.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vendors/#{@vendor.id}/edit", "/update_vendor"
        redirect_to("/vendors/#{@vendor.id}", :notice => "Vendor updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Vendor updated successfully.")
      end
    else
      render("vendors/edit.html.erb")
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])

    @vendor.destroy

    if URI(request.referer).path == "/vendors/#{@vendor.id}"
      redirect_to("/", :notice => "Vendor deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Vendor deleted.")
    end
  end
end
