module DashboardsHelper
    def display_enrolled_programs(student)
        if student.enrollments.any?
          student.enrollments.map { |enrollment| enrollment.program.name }.join(", ")
        else
          "Not enrolled in any program"
        end
    end 
end
