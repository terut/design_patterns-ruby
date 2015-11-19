require 'fileutils'
require './command'
class CopyFile < Command
  def initialize(source, target)
    super("Copy file : #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy(@source, @target)
  end

  def undo_execute
    File.delete(@target)
  end
end
