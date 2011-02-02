# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{eycap}
  s.version = "0.5.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Engine Yard"]
  s.date = %q{2011-01-28}
  s.description = %q{A bunch of useful recipes to help deployment to Engine Yard private cloud slices}
  s.email = %q{appsupport@engineyard.com}
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/capistrano/recipes/deploy/strategy/filtered_remote_cache.rb", "lib/capistrano/recipes/deploy/strategy/unshared_remote_cache.rb", "lib/eycap.rb", "lib/eycap/lib/ey_logger.rb", "lib/eycap/lib/ey_logger_hooks.rb", "lib/eycap/recipes.rb", "lib/eycap/recipes/backgroundrb.rb", "lib/eycap/recipes/database.rb", "lib/eycap/recipes/bundler.rb", "lib/eycap/recipes/deploy.rb", "lib/eycap/recipes/ferret.rb", "lib/eycap/recipes/juggernaut.rb", "lib/eycap/recipes/memcached.rb", "lib/eycap/recipes/mongrel.rb", "lib/eycap/recipes/monit.rb", "lib/eycap/recipes/nginx.rb", "lib/eycap/recipes/slice.rb", "lib/eycap/recipes/solr.rb", "lib/eycap/recipes/sphinx.rb", "lib/eycap/recipes/templates/maintenance.rhtml", "lib/eycap/recipes/tomcat.rb", "lib/eycap/recipes/passenger.rb", "lib/eycap/recipes/apache.rb", "lib/eycap/recipes/ssl.rb", "test/test_eycap.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/engineyard/eycap}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{eycap}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Capistrano tasks for Engine Yard private cloud slices}
  s.test_files = ["test/test_eycap.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 2.2.0"])
      s.add_development_dependency(%q<hoe>, [">= 2.8.0"])
    else
      s.add_dependency(%q<capistrano>, [">= 2.2.0"])
      s.add_dependency(%q<hoe>, [">= 2.8.0"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 2.2.0"])
    s.add_dependency(%q<hoe>, [">= 2.8.0"])
  end
end
