class PostTypesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_post_type, only: [:show, :edit, :update, :destroy]

  # GET /post_types
  # GET /post_types.json
  def index
    @post_types = PostType.all
  end

  # GET /post_types/1
  # GET /post_types/1.json
  def show
  end

  # GET /post_types/new
  def new
    @post_type = PostType.new
  end

  # GET /post_types/1/edit
  def edit
  end

  # POST /post_types
  # POST /post_types.json
  def create
    @post_type = PostType.new(post_type_params)

    respond_to do |format|
      if @post_type.save
        format.html { redirect_to @post_type, notice: 'Post type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_types/1
  # PATCH/PUT /post_types/1.json
  def update
    respond_to do |format|
      if @post_type.update(post_type_params)
        format.html { redirect_to @post_type, notice: 'Post type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_types/1
  # DELETE /post_types/1.json
  def destroy
    @post_type.destroy
    respond_to do |format|
      format.html { redirect_to post_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_type
      @post_type = PostType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_type_params
      params.require(:post_type).permit(:name)
    end
end
