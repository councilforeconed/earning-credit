class Ability
  include CanCan::Ability

  def initialize(user)
    teacher ||= Teacher.new
    can :manage, Student do |student|
      student.try(:teacher_email) == teacher.email
    end
  end
end
