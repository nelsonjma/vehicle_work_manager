module LayoutOperations
  module UserLayoutHelper

    def admin_operations
      return '' unless current_user.is_admin?

      title = content_tag(:a, capture {
                                    concat 'Admin'
                                    concat tag(:span, class: :caret)
                                  }, class: 'dropdown-toggle', :data => { :toggle => 'dropdown' }, :aria => { haspopup: true, expanded: false }, :role => 'button', :href => '#')

      links = content_tag(:ul, capture {
                               concat content_tag(:li, (link_to 'Tarefas', '/tasks'))
                               concat content_tag(:li, (link_to 'Tipos de Veiculos', '/vehicle_types'))
                             }, class: 'dropdown-menu')

      capture {
        content_tag(:li, capture {
                         concat title
                         concat links
                       }, class: 'dropdown')
      }
    end

  end
end