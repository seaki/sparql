source "https://rubygems.org"

gemspec :name => ""

gem "rdf",            :git => "git://github.com/ruby-rdf/rdf.git", :branch => "1.1"
gem "rdf-spec",       :git => "git://github.com/ruby-rdf/rdf-spec.git", :branch => "1.1"
gem "rdf-xsd",        :git => "git://github.com/ruby-rdf/rdf-xsd.git", :branch => "1.1"
gem "rdf-turtle",     :git => "git://github.com/ruby-rdf/rdf-turtle.git", :branch => "1.1"
gem "rdf-rdfxml",     :git => "git://github.com/ruby-rdf/rdf-rdfxml.git"
gem 'ebnf',           :git => "git://github.com/gkellogg/ebnf.git"

group :debug do
  gem 'shotgun'  unless ENV['CI']
  gem 'debugger', :platforms => :mri_19
  gem "wirble"
  gem 'redcarpet', :platforms => :ruby
end

group :test do
  gem 'rake'
end