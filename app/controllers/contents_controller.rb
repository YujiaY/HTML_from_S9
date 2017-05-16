class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]



  # GET /contents
  # GET /contents.json
  def index
    @users = User.all
    @courses = Course.all
    @allcontents = Content.all
    @usercourses = Course.includes(:users)
    @current_user_courses = current_user.courses.includes(:contents)
    #@current_user_courses = current_user.includes(courses: [:contents]).courses
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
      @contentshow = Content.find_by(name: params[:name])
          
  end

  def preview
    
    #@contentinpreview = Content.find(params[:content_id])
          if Content.exists?(id: params[:id])
        @contentinpreview = Content.find(params[:id])
      else
        @contentinpreview = Content.find_by(name: params[:id])

      end
 
  end


  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      #if Content.exists?(name: params[:name])
      if Content.exists?(id: params[:id])
        @content = Content.find(params[:id])
      else
        @content = Content.find_by(name: params[:id])

      end

      #@contentshow = Content.find_by(name: params[:name])
   # else
     # @content = Content.find_by(id: params[:id])
    #end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:name)
    end
end
