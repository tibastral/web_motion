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

```ruby
# ./app/app_delegate.rb
class AppDelegate
  def main_controller
    app_url = 'rushoutapp.com' # PUT HERE YOUR OWN APP URL
    @main_controller ||= WebMotion::WebMotionController.new(url: 'rushoutapp.com')
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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tibastral/web_motion. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
