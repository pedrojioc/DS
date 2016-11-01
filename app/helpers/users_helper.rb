module UsersHelper
  #Determina si se debe mostrar el boton de cambiar cover o avatar
  def buttons_image_for_user user, id, attr_for
    if user == current_user
      button_update_image id, attr_for
    else
      nil
    end
    
  end

  #Este método recibe la id que tendrá el boton, y recibe "attr_for" que es el atributo for
  def button_update_image id, attr_for
    button = content_tag(:button, "",id:"#{id}", class:"btn btn-outline-black btn-sm", type:"button", :"for" => "#{attr_for}") do
      content_tag(:i, "", class:"fa fa-camera file-active", :"aria-hidden" => :true)
    end
  end
end
