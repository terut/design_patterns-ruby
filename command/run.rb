require './composite_command'
require './create_file'
require './delete_file'
require './copy_file'

command_list = CompositeCommand.new
command_list.add_command(CreateFile.new("file1.txt", "hello world\n"))
command_list.add_command(CopyFile.new("file1.txt", "file2.txt"))
command_list.add_command(DeleteFile.new("file1.txt"))

command_list.execute
puts command_list.description

command_list.undo_execute
