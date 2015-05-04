require 'rake/win32'
require 'fileutils'
require 'pathname'
require File.join(File.dirname(__FILE__), 'installer')

class Translation
  attr_accessor :source, :target

  def initialize(source_path, target_path)
    @source = pathname(source_path)
    @target = pathname(target_path)
  end

  def self.windows?
    Rake::Win32.windows?
  end

  def link
    if windows?
      hard_link
    else
      soft_link
    end
  end

  def hard_link
    raise "This source file does not exist: #{source}" unless source_exists?
    `cp -R \"#{source}\" \"#{target}\"`
  end

  def soft_link
    raise "This source file does not exist: #{source}" unless source_exists?
    `ln -s \"#{source}\" \"#{target}\"`
  end

  def force_link
    FileUtils.rm_rf(target) && link
  end

  def safe_to_link?
    identical? || !target_exists?
  end

  def source_exists?
    File.exists?(source)
  end

  def target_exists?
    File.exists?(target)
  end

  def identical?
    File.identical?(source, target)
  end

  private

  def pathname(file)
    path = Installer.translate_path(file)
    Pathname.new(path).expand_path
  end

end
