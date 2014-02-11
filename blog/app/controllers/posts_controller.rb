class PostsController < ApplicationController
  
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  
  def index
    @posts = Post.all
  end
  
  #defino accion new para el controlador post
  def new
    #evito que post sea nil en caso de que haya errores
    @post = Post.new
  end
  
  #defino accion crear, el submit del form me redirige a esta action
  def create
    @post = Post.new(post_params)
    #guardo los datos en el modelo
     if @post.save
       redirect_to @post
     else
       render 'new'
     end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
   
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
   
    redirect_to posts_path
  end
  
  def show
    #consulta API del modelo
    @post = Post.find(params[:id])
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
  
  
  
end
