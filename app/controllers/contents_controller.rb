class ContentsController < ApplicationController
  def index
    @contents = Content.all
    if params[:start_date] != nil
      date = params[:start_date]
      @time = Date.parse(date)
      this_month = @time.month
      this_year = @time.year
      @month_total = Content.group("YEAR(start_time)").group("MONTH(start_time)").sum(:money)
      @month_total[[this_year, this_month]]
      @month_total_view = @month_total[[this_year, this_month]]
    else
      render 'index'
    end
  end

  def new
    @content = Content.new
  end

  def create
    if Content.create(params_content)
      redirect_to contents_path(@time)
    else
      render action: :index
    end
  end

  def show 
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(params_content)
      redirect_to content_path
    else
      render action: :edit
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to root_path
  end

  private

  def params_content
    params.require(:content).permit(:title, :money, :start_time)
  end
end
