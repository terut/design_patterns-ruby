# ConcreteObserver
class Payroll
  def update(changed_employee)
    puts "彼の給料は#{changed_employee.salary}になりました! #{changed_employee.title}のために新しい小切手を切ります。"
  end
end
