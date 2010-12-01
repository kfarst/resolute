# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{paperclipftp}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Damian Caruso"]
  s.date = %q{2010-03-07}
  s.description = %q{Ftp storage support for paperclip file attachment}
  s.email = %q{damian.caruso@gmail.com}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc", "Rakefile", "VERSION", "lib/paperclipftp.rb", "test/paperclipftp_test.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/cdamian/paperclipftp}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ftp storage support for paperclip file attachment}
  s.test_files = ["test/paperclipftp_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<paperclip>, [">= 2.3.0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<paperclip>, [">= 2.3.0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<paperclip>, [">= 2.3.0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
