# WebMotion

Welcome to your WebMotion! The RubyMotion gem to handle Js Simple Calls from a Web View.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'web_motion'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install web_motion

## Usage

You need two files to test WebMotion : an app delegate and a Rakefile (these two files already exists by default)

```sh
motion create mywebmotionproject
cd mywebmotionproject
```

```ruby
# ./app/app_delegate.rb
class AppDelegate
  def main_controller
    app_url = 'rushoutapp.com' # PUT HERE YOUR OWN APP URL
    @main_controller ||= WebMotion::WebMotionController.new(url: app_url)
  end

  def full_screen_window
    w = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    w.rootViewController = main_controller
    w.makeKeyAndVisible
    w
  end

  # handlers
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = full_screen_window

    true
  end
end
```

You also need a Rakefile for the project to work

```ruby
# ./Rakefile
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.name = 'Your app name'
  app.version = '0.0.1'
  app.identifier = 'com.your_company.app_name'
  # WebKit.framework => for launching external urls directly in Safari (required for WebMotion)
  app.frameworks += ['WebKit']
  # https://david-smith.org/iosversionstats/
  app.deployment_target = '8.4' # required for WebMotion

  app.codesign_certificate = 'TODO: put a codesign certificate' # ex : 'iPhone Developer: John Doe (UENTOH78)'
  app.provisioning_profile = 'TODO: put a path to your provisioning_profile' # ex : '~/Library/MobileDevice/Provisioning Profiles/8329ee89-3298-3898-8398-8b3893829823.mobileprovision'
end
```

Then you can put that code inside your web app to call the native functions directly from your web app !

```js
$('.share').click(function () {
  var url = document.location.protocol + "//" + document.location.hostname + document.location.pathname;
  webkit.messageHandlers.shareButtonPressed.postMessage("Hey, check out that on RushOut : " + url);
})

$('a[target=_blank]').click(function () {
  webkit.messageHandlers.openInSafari.postMessage($(this).attr('href'));
})
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tibastral/web_motion. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
