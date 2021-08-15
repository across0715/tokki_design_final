class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def gallery
  end

  #def contacts
  #end

  def designs_detail
    @index = params[:id]
  end

  def faq
  end
end
