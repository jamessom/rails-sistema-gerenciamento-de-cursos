require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--format html --out ./reports/rspec_results.html'
end

namespace :rspec_report do
  desc 'Run all specs and generate RSpec report in HTML'
  task :html => :spec
end