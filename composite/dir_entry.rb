# Composite: ディレクトリはその下にファイルを持つ、つまり再帰できるので
require './entry'
class DirEntry < Entry
  def initialize(name)
    @name = name
    @directory = Array.new
  end

  def get_name
    @name
  end

  def add(entry)
    @directory.push(entry)
  end

  def ls_entry(prefix)
    puts "#{prefix}/#{get_name}"
    @directory.each do |e|
      e.ls_entry("#{prefix}/#{get_name}")
    end
  end

  def remove
    @directory.each do |e|
      e.remove
    end
    puts "#{get_name}を削除しました"
  end
end
