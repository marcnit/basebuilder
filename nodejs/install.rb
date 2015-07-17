require 'yaml'
path = ENV["CURRENT_DIR"] || ""
tsuru = YAML.load_file( path + 'tsuru.yml')

if tsuru["dependencies"]
  tsuru["dependencies"].each do |dependency|
     package = dependency[0]
     version = dependency[1] ? "@" + dependency[1] : ""
     system "cd #{path} && npm install #{package}#{version}"
  end
end
