class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate 
  before_filter :sidebar

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
        username == "fora" && password == "craigslistkiller"
    end
    warden.custom_failure! if performed?
  end

  def sidebar
  	@boardsList = Board.all
    @boardsListLast = Board.find(:all, :limit => 10).reverse
    @postsListLast = Post.tally({:at_least => 1, :at_most => 10000, :limit => 10, :order => 'vote_count desc'})
  end

end
