require "rake/testtask"
require "open-uri"

Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
end

task default: :test

task format: "coverage/codeclimate.resultset.json"

file "cc-test-reporter" do |t|
  File.open(t.name, "wx") do |dest|
    URI.open("https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64") do |src|
      IO.copy_stream(src, dest)
    end
  end
  File.chmod(0o755, t.name)
end

file "coverage/.resultset.json" => :test

file "coverage/codeclimate.resultset.json" => %w[cc-test-reporter coverage/.resultset.json] do |t|
  sh "./cc-test-reporter", "format-coverage", "--input-type", "simplecov", "--output", t.name
end
