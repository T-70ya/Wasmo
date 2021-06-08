class ContentsController < ApplicationController
  def index
    @contents = Content.all
    @content = Content.new
  end
end
