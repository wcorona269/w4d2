class Employee
    attr_reader :name, :title, :salary, :boss
    
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = (@salary) * multiplier
    end
end

class Manager < Employee
    attr_reader :employees
    
    
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end
    
    def add_employees(employee)
        self.employees << employee
    end

    def total_pay
        # return self.salary if !self.is_a?(Manager)
        sub_salaries = 0
        self.employees.each do |employee|
            if employee.is_a?(Manager)
                sub_salaries += employee.salary + employee.total_pay
            else
                sub_salaries += employee.salary
            end
        end

        sub_salaries
    end

    def bonus(multiplier)
        self.total_pay * multiplier 
    end
end

ned = Manager.new("ned", "Founder", 1000000, nil)
darren = Manager.new("darren", "TA Manager", 78000, ned)
shawna = Employee.new("shawna", "TA", 12000, darren)
david = Employee.new("david", "TA", 10000, darren)

ned.add_employees(darren)
darren.add_employees(shawna)
darren.add_employees(david)

p shawna.bonus(4) # => 88_000
p david.bonus(3) # => 30_000

p ned.bonus(5) # => 500_000
p darren.bonus(2)