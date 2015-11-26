# set the env here since the app config loaded by container uses this name by
# default
ENV["RACK_ENV"] = "test"

SPEC_ROOT = Pathname(__FILE__).dirname

# Only load the container, if a test needs the whole web stack it should require
# web_helper instead
require SPEC_ROOT.join("../core/trug/container")

RSpec.configure do |config|
  # Obviously
  config.disable_monkey_patching!
end
