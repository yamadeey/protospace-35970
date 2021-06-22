class PrototypesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :move_to_edit, except: [:index, :show]
  before_action :authenticate_user!, only: [:index, :show, :new]
  #def Prototypes_params
    #params.require(:Prototypes).permit(:content, :image).merge(user_id: current_user.id)
  #end

  def index
    @prototype = Prototype.all.includes(:user)
 end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to action: :show
    else
      @prototype = Prototype.find(params[:id])
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private  # private以下の記述はすべてプライベートメソッドになる

  def prototype_params
    params.require(:prototype).permit(:content, :image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def move_to_edit
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def move_to_update
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def move_to_destroy
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  # def move_to_index
  #   prototype = Prototype.find(params[:id])
  #   if prototype.user_id != current_user.id
  #     redirect_to action: :index
  #   end
  # end
end
