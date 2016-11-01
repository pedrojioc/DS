class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
=begin  def button_update_image id, for
    button = h.content_tag(:button, "",id:"#{id}", class:"btn btn-outline-black btn-sm", type:"button", :"for" => "#{for}") do
      h.content_tag(:i, "", class:"fa fa-camera file-active", :"aria-hidden" => :true)
    end
  end
=end
end
