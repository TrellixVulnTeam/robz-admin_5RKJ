class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_action :set_post, only: [ :update, :destroy]
  before_action :get_post, only: [:show, :edit]

  # GET /posts
  # GET /posts.json
  def index
    require 'uri'
    @posts = Post.joins(:category).select("posts.id, posts.title, posts.link, posts.refer, posts.status, posts.post_type, posts.comment_status, categories.name").where("posts.status = ?",1)     
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    
  end

  # GET /posts/new
  def new
    @post = Post.new
    @category = Category.all
    @post_type = PostType.all
  end

  # GET /posts/1/edit
  def edit
    @category = Category.all
    @post_type = PostType.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      puts post_params
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
  
    def get_post
      @post = Post.joins(:category).select("posts.*, categories.name").where("posts.id = ?",params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :link, :refer, :category_id, :excerpt, :content, :status, :parent, :post_type, :comment_status)
    end
end
