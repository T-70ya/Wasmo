class ContentsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :destroy, :update, :show, :search]
  before_action :ryaku, only: [:show, :edit, :update, :destroy]
  
  def index
    @contents = Content.all
    @plans = Plan.all
    if params[:start_date] != nil
      date = params[:start_date]
      @time = Date.parse(date)
      this_month = @time.month
      this_year = @time.year
      @month_user = Content.group("YEAR(start_time)").group("MONTH(start_time)").group(:user_id)
      @month_total = @month_user.sum(:money)
      @month_total[[this_year, this_month, current_user.id]]
      @month_total_view = @month_total[[this_year, this_month, current_user.id]]
    else
      render 'index'
    end
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(params_content)
    if @content.save
      redirect_to contents_path(@time)
    else
      render action: :new
    end
  end

  def show 
  end

  def edit
  end

  def update
    if @content.update(params_content)
      redirect_to content_path
    else
      render action: :edit
    end
  end

  def destroy
    @content.destroy
    redirect_to root_path
  end

  def search
    @contents = Content.search(params[:keyword])
    @keyword = params[:keyword]
    render "search"
  end


  private

  def params_content
    params.require(:content).permit(:title, :money, :start_time).merge(user_id: current_user.id)
  end

  def ryaku
    @content = Content.find(params[:id])
  end
end
