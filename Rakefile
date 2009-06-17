require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('acts_as_censored', '0.1.1') do |p|
  p.description              = "Filters bad words from content."
  p.summary                  = "Keep people from using potty language."
  p.url                      = "http://www.gitforked.com"
  p.author                   = "Tim Matheson"
  p.email                    = "me@timmatheson.com"
  p.ignore_pattern           = ["tmp/*","script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
