class CommoditiesController < ApplicationController
  def new
    @commodity=Commodity.new
  end
  def create
    @commodity=Commodity.new(params[:commodity])
    if @commodity.save
        redirect_to "/commodities"
    end
  end
  def show
    @commodity=Commodity.find(params[:id])
  end
  def edit
    @commodity=Commodity.find(params[:id])
  end
  def update
    @commodity = Commodity.find(params[:id])

    respond_to do |format|
      if @commodity.update_attributes(params[:commodity])
        format.html { redirect_to(@commodity, :notice => '商品信息已成功修改！') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @commodity.errors, :status => :unprocessable_entity }
      end
    end
  end
  def index
    @commodities = Commodity.paginate(:page => params[:page], :per_page => 10)
  end
  def dest
    @commodity = Commodity.find(params[:id])
    @commodity.destroy
    redirect_to "/commodities"
  end
  def add_to_cart
    @a =[]
    @a =session[:cart] unless session[:cart].nil?
    flash[:notice]="成功放入购物车！"
    @a << params[:id]
    session[:cart] = @a
    redirect_to "/commodities"
  end
  def cart
    if session[:cart]==nil
      @commodities=nil
    else
      @commodities=Commodity.find_by_sql("select * from commodities c where c.id in (#{session[:cart].join(",")})")
    end
  end
  def empty_cart
    session[:cart]=nil
    flash[:empty]="购物车已清空"
    redirect_to "/commodities"
  end
  
end
