require 'rubygems'

class DotFile
  attr_accessor :file

  def initialize file
    @file = file
  end

  def file_exists?
    puts file
    p File.exist?(file)
  end

  def backup_file
    system("mv ~/.#{file} ~/.#{file}.bkp")
    puts "Backed existing ~/.#{file} to ~/#{file}.bkp"
  end

  def copy_file
    system("cp #{file} ~/.#{file}")
    puts "Installed #{file} to ~/.#{file}"
  end

  def install
    backup_file if file_exists?
    copy_file
  end
end

Dir.foreach('.') do |file|
  next if file == "." || file == ".." || File.directory?(file)
  file = DotFile.new file
  file.install
end
