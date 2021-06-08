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

  #def edit
    #@content = Content.find(params[:id])
  #end

  #def update
    #@content = Content.find(params[:id])
    #if @content.update
      #redirect_to content_path
    #else
      #render action: :edit
    #end

  private

  def params_content
    params.require(:content).permit(:title, :money, :start_time)
  end
end
