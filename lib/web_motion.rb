unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  ["web_motion/*.rb", "web_motion/concerns/*.rb"].each do |path|
    Dir.glob(File.join(File.dirname(__FILE__), path)).each do |file|
      app.files.unshift(file)
    end
  end
end

#
# module WebMotion
#   # Your code goes here...
# end
