# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

#ubiraet soobschenija "warning" kotorye zasojajut vyvod terminala
RUBYOPT='-W:no-deprecated -W:no-experimental'
