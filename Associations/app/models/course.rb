class Course < ApplicationRecord
  has_many :enrollments,
    class_name: :Enrollment,
    primary_key: :id,
    foreign_key: :course_id

  has_many :students,
    through: :enrollments, #its own method
    source: :user #that method's(the one above) method 

  belongs_to :prereq, #self association uses this and the next (has_many)
    class_name: :Course
  
  has_many :courses,
    class_name: :Course, 
    foreign_key: :prereq_id

  belongs_to :instructor, #self association uses this and the next (has_many)
    class_name: :User,
    primary_key: :id, 
    foreign_key: :instructor_id #because instructor_id in course (course belongs to instructor)
end
