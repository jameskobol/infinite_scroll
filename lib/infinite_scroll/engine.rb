module InfiniteScroll
  class Engine < Rails::Engine
    initializer "setup for rails" do
      ActionView::Base.send(:include, InfiniteScroll::InfiniteScrollHelpers)
      ActionController::Base.send(:include, InfiniteScroll::ControllerExtensions)
    end
  end
end
