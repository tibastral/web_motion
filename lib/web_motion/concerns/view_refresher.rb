module WebMotion::ViewRefresher
  def refreshView
    view.reload
  end

  def refreshViewOnlyIfIndex
    if currentUrl.absoluteString.split('?').first.split('/').last == mainUrl
      refreshView
    end
  end

  # handlers
  def handleRefresh(refresh)
    refreshView
    refresh.endRefreshing
  end

  private

  def currentUrl
    view.URL
  end

  def autoRefresher
    refreshControl = UIRefreshControl.new
    refreshControl.addTarget(self, action: 'handleRefresh:', forControlEvents: UIControlEventValueChanged)
  end
end
