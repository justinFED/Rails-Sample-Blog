class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = 'comment created successfully'
      redirect_to comments_path
    else
      flash.now[:alert] = 'comment create failed'
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
 if @comment.update(comment_params)
      flash[:notice] = 'comment updated successfully'
      redirect_to comments_path
    else
      flash.now[:alert] = 'comment update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    flash[:notice] = 'comment destroyed successfully'
    flash[:notice] = 'comment deleted successfully'
    redirect_to comments_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:post_id, :body)
    end
end
