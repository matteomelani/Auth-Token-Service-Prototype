class CoursesController < ApplicationController

  before_filter :authenticate_user!
  respond_to :html, :json
  
  def index
    @courses = Course.all
    respond_with(@courses)
  end
  
  def show
    @course=Course.find(params[:id])
    respond_with(@course)
  end
  
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(params[:course])
    respond_with(@course) do |format|
          format.html do 
            if @course.save
              redirect_to courses_path
            else
              render :new
            end
          end
        end
    end
  

end
