class WebMotion::WebMotionController < UIViewController
  include WebMotion::UrlHelpers
  include WebMotion::WKConfigInitializer
  include WebMotion::ViewRefresher
  include WebMotion::WebMotionPreferences

  def initialize(config)
    @mainUrl = config[:url]
  end

  def loadView
    self.view = WKWebView.alloc.initWithFrame(UIScreen.mainScreen.bounds, configuration: initWKConfig)
  end

  def viewDidLoad
     super
     view.loadRequest(request(fullUrl))
     view.scrollView.addSubview(autoRefresher)
  end
end
