class WebMotion::WebMotionJsHandler
  def initialize(wm_controller)
    @wm_controller = wm_controller
  end

  # This method is used to get all the methods called by javascript in an array
  def self.message_handlers
    instance_methods(false).map(&:to_s).map{|e| e.gsub(':', '')}
  end

  # Methods called by Javascript
  def shareButtonPressed(texttoshare)
    @wm_controller.presentViewController(sharer(texttoshare), animated: true, completion: nil)
  end

  def openInSafari(url)
    UIApplication.sharedApplication.openURL(NSURL.URLWithString(url))
  end

  private

  def sharer(texttoshare)
    activityItems = [texttoshare]
    activityVC = UIActivityViewController.alloc.initWithActivityItems(activityItems, applicationActivities: nil)
    activityVC.excludedActivityTypes = [UIActivityTypeAssignToContact, UIActivityTypePrint]
    activityVC
  end
end
