Alfred::App.helpers do
  def current_karma
    session[:current_karma] ||= Karma.count_for_student_in_course(current_account, Course.active)
  end

  def update_current_karma
    if(current_account.role == 'student') 
      session[:current_karma] = Karma.count_for_student_in_course(current_account, current_course)
    end
  end
end