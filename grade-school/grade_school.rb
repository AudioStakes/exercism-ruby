class School
  attr_reader :db

  def initialize
    @db = Hash.new { [] }
  end

  def add(student, grade)
    db[grade] <<= student
    db[grade].sort!
  end

  def students(grade)
    db[grade]
  end

  def students_by_grade
    db.sort.map { |grade, students| { grade: grade, students: students } }
  end
end