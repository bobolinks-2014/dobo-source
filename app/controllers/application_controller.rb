class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :get_tags
 
  def get_tags
    @tags_0 = tags_phase_0
    @tags_1 = tags_phase_1
    @tags_2 = tags_phase_2
    @tags_3 = tags_phase_3
    @tags_a = tags_alumni
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :current_password, :password_confirmation, :password, :email, :cohort_year, :cohort_animal) }
  end

  def tags_phase_0
    articles = Article.tagged_with("phase0").tag_counts
    sorted = articles.sort {|tag1,tag2| tag2.count <=> tag1.count }
    return sorted
  end

  def tags_phase_1
    articles = Article.tagged_with("phase1").tag_counts
    sorted = articles.sort {|tag1,tag2| tag2.count <=> tag1.count }
    return sorted
  end

  def tags_phase_2
    articles = Article.tagged_with("phase2").tag_counts
    sorted = articles.sort {|tag1,tag2| tag2.count <=> tag1.count }
    return sorted
  end

  def tags_phase_3
    articles = Article.tagged_with("phase3").tag_counts
    sorted = articles.sort {|tag1,tag2| tag2.count <=> tag1.count }
    return sorted
  end

  def tags_alumni
    articles = Article.tagged_with("alumni").tag_counts
    sorted = articles.sort {|tag1,tag2| tag2.count <=> tag1.count }
    return sorted
  end

end
