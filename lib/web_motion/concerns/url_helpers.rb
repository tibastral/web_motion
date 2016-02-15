# helpers methods
module WebMotion::UrlHelpers
  private
  def mainUrl
    @mainUrl
  end

  def rootUrl
    "https://#{mainUrl}"
  end

  def fullUrl
    "#{rootUrl}/?hybrid=1&ios=1"
  end

  def request(url)
    NSURLRequest.requestWithURL(NSURL.URLWithString(url))
  end
end
