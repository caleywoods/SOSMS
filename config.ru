require 'rubygems'
require 'bundler/setup'

require File.dirname(__FILE__) + '/sosms'
use Rack::Static, :urls => ["/css", "/images"], :root => "public"

run Sosms
