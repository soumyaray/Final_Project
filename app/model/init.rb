%w[entities mappers]
.each do |folder|
    require_relative "#{folder}/init.rb"
end