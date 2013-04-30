module InfiniteScroll
  class Railtie < Rails::Railtie
    config.after_initialize do
      InfiniteScroll::ViewHelpers = ActionView::Base.new
    end
  end
end
