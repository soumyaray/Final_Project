require 'rake/testtask'

desc 'run tests'
task :spec do 
    sh 'ruby spec/unsplash_api_spec.rb'
end

namespace :quality do 
    task :flog do 
        sh 'flog lib/'
    end

    task :reek do
        sh 'reek lib/'
    end

    task :rubocop do 
        sh 'rubocop'
    end
end
