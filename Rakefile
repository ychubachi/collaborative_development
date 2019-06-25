MASTER_FILENAME='collaborative_development.adoc'
BUILD_DIR='docs'
# autoload :FileUtils, 'fileutils'

desc 'Build the HTML5 format'
task :html do
  require 'asciidoctor'
  Asciidoctor.convert_file MASTER_FILENAME,
    safe: :unsafe,
    to_dir: BUILD_DIR,
    to_file: 'index.html',
    mkdirs: true
end

desc 'Build the PDF format'
task :pdf do
  require 'asciidoctor-pdf'
  Asciidoctor.convert_file MASTER_FILENAME,
    safe: :unsafe,
    backend: 'pdf',
    to_dir: BUILD_DIR,
    mkdirs: true
end

task default: [:html,:pdf]