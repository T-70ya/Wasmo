class ContentsController < ApplicationController
  def index
    @contents = Content.all
    @content = Content.new
  end

  def create
    if Content.create(params_content)
      redirect_to root_path
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
