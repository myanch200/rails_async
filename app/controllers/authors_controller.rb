class AuthorsController < ApplicationController
  def index
    @pagy, @authors = pagy(Author.all)
    console
  end

  def show
    @author = Author.includes(books: [{ cover_attachment: :blob }, :rich_text_description ]).find(params[:id])
  end

  def edit
  end

  def new
  end
end
