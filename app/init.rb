%w[controllers model]
.each do |folder|
    require_relative "#{folder}/init.rb"
end