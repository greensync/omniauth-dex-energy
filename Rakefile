# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: 'spec'

RuboCop::RakeTask.new

task default: 'rubocop'
