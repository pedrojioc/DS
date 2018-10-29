module UsersHelper

  # Boton para actualizar la imagen de portada
  def button_update_cover user
    if user == current_user
      button = content_tag(:button, "Cambiar cover", id:"btn-user-cover", class:"change-cover", type:"button") do
        concat content_tag(:i, "", class:"fa fa-picture-o", :"aria-hidden" => :true)
        concat " Cambiar cover"
      end
    end
  end

  #Boton para actualizar la imagen del avatar, en caso de ser el propietario del perfil
  def button_update_avatar user
    if user == current_user
      content_tag(:button, "", id:"btn-user-avatar", class:"avatar-preview avatar-preview-128", type:"button") do
        concat circle_img user.avatar.url(:medium),150
        concat span_update
      end
    else
      content_tag(:div, "", id:"content-avatar", style:"margin-bottom:20px;") do
        circle_img user.avatar.url(:medium),150
      end
    end
  end

  def span_update
    content_tag(:span, "", class:"update") do
      concat content_tag(:i, "", class:"fa fa-picture-o", :"aria-hidden" => :true)
      concat " Cambiar avatar"
    end
  end

end
