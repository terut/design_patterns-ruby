require 'fileutils'
require './command'
class DeleteFile < Command
  def initialize(path)
    super("Delete file : #{path}")
    @path = path
  end

  def execute
    if File.exists?(@path)
      @content = File.read(@path)
    end
    File.delete(@path)
  end

  def undo_execute
    if @content
      f = File.open(@path, "w")
      f.write(@content)
      f.close
    end
  end
end
