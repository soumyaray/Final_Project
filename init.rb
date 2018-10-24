%w[app config]
.each do |folder|
    require_relative "#{folder}/init.rb"
end
