class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :get_tags
 
  def get_tags
    @tags_0 = tags("phase0")
    @tags_1 = tags("phase1")
    @tags_2 = tags("phase2")
    @tags_3 = tags("phase3")
    @tags_a = tags("alumni")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :current_password, :password_confirmation, :password, :email, :cohort_year, :cohort_animal) }
  end

  def tags(phase)
    articles = Article.tagged_with(phase).tag_counts
    articles.sort { |tag1,tag2| tag2.count <=> tag1.count }
  end


end
