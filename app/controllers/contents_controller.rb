class ContentsController < ApplicationController
  def index
    @contents = Content.all
    @content = Content.new
  end

  def create
    Content.create(params_content)
    redirect_to contents_path
  end

  #def show 
    #@content = Content.find(params[:id])
  #end

  private

  def params_content
    params.require(:content).permit(:title, :money, :start_time)
  end
end
