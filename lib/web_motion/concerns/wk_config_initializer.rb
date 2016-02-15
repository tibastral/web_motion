module WebMotion::WKConfigInitializer
  def initWKConfig
    configuration = WKWebViewConfiguration.new
    configuration.userContentController = initWKController;
    configuration
  end

  # handler called directly by client side javascript
  def userContentController(_ , didReceiveScriptMessage: message)
    if WebMotion::WebMotionJsHandler.message_handlers.include?(message.name)
      @jsHandler.send(message.name, message.body)
    end
  end

  private

  def initWKController
    controller = WKUserContentController.new
    WebMotion::WebMotionJsHandler.message_handlers.each do |message_handler|
      controller.addScriptMessageHandler(self, name: message_handler)
    end
    # We create here our Js Handler to be able to call native code from the JS
    @jsHandler = WebMotion::WebMotionJsHandler.new(self)
    controller
  end
end
