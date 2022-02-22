require_relative 'employee'


class Manager < Employee
    def initialize
        @employees = []
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
        #bonus = (total salary of all sub-employees) * multiplier
        my_bonus = self.total_pay * multiplier 

    end
end

