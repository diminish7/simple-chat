# frozen_string_literal: true

desc 'Run ESLint'
task :eslint do
  system('bin/yarn lint') || exit!(1)
end

task default: :eslint
