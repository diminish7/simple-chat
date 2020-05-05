# frozen_string_literal: true

if Gem.loaded_specs.key? 'erb_lint'
  desc 'Run the ERB linter'
  task :erblint do
    require 'erb_lint/cli'
    ERBLint::CLI.new.run(%w[--lint-all])
  end

  task default: :erblint
end
