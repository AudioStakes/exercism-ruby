class School
  attr_reader :students_all

  def initialize
    @students_all = []
  end

  def students(grade)
    students_all
      .select { |s| s.grade == grade}
      .map(&:name)
      .sort
  end

  def students_by_grade
    students_all.map(&:grade).uniq.sort.map do |grade|
      { grade: grade, students: students(grade) }
    end
  end

  def add(student_name, grade)
    students_all << Student.new(student_name, grade)
  end
end

class Student
  attr_reader :name, :grade
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
end