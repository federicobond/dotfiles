require 'irb/completion'

$array = [1, 2, 3, 4, 5]
$hash = {:foo => "bar", :baz => "qux"}

def load_irbrc(path)
  return if (path == ENV["HOME"]) || (path == '/')
  load_irbrc(File.dirname path)
  irbrc = File.join(path, ".irbrc")
  load irbrc if File.exists?(irbrc)
end

load_irbrc Dir.pwd # probably should stay at the bottom
