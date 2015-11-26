require './report'
require './formatter'

report = Report.new(HTMLFormatter.new)
report.output_report

report.formatter = PlaneTextFormatter.new
report.output_report

puts "\nReport using Proc"
require './proc_report'

report = ProcReport.new(&HTML_FORMATTER)
report.output_report

report.formatter = PLANE_TEXT_FORMATTER
report.output_report
