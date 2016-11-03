class MainController < ApplicationController
	#Cuando se crea un controlador, por ejemplo este. Rails crea una carpeta en vistas con el nombre del controlador,
	#en este caso "main" y creo el metodo home que le indicamos en el script, este metodo esta vacio, rails implicitamente
	#deduce que debe buscar en la carpeta vistas una carpeta con el nombre de la clase ("main") y dentro de esa carpeta
	#un archivo con el nombre home, que corresponde a la accion o metodo.
  def home
    respond_to do |format|
      @post = Post.new
      @posts = Post.all_for_user(current_user).nuevos.paginate(page:params[:page], per_page:15)

      format.html { }
      format.js { }
    end
  end

  def unregistered
  end

  def set_layout
  	return "landing" if action_name == "unregistered"
  	super
  end
end
