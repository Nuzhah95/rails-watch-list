class ListsController < ApplicationController

  def index
    if params[:query].present?
      @query = params[:query]
      @lists = List.where("name ILIKE ?","%#{params[:query]}%")
    else
      @lists = List.all
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new  #(list: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
end
