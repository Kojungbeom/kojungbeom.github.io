# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "kjb-theme"
  spec.version       = "0.1.0"
  spec.authors       = ["Kojungbeom"]
  spec.email         = ["rhwndqja@icloud.com"]

  spec.summary       = "Create Blog theme before OS"
  spec.homepage      = "https://kojungbeom.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.1"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.12"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.6"
end
