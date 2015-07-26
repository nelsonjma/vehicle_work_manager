module LayoutOperations
  module UserLayoutHelper

    def admin_operations
      return '' unless current_user.is_admin?

      title = content_tag(:a, capture {
                                    concat 'Admin'
                                    concat tag(:span, class: :caret)
                                  }, class: 'dropdown-toggle', :data => { :toggle => 'dropdown' }, :aria => { haspopup: true, expanded: false }, :role => 'button', :href => '#')

      links = content_tag(:ul, capture {
                               concat content_tag(:li, (link_to 'Utilizadores', '/users'))
                               concat content_tag(:li, (link_to 'Relatorios', '#'))
                               concat content_tag(:li, (link_to 'Tipos de Veiculos', '/vehicle_types'))
                               concat content_tag(:li, (link_to 'Stock', '/stock_items'))
                               concat content_tag(:li, (link_to 'Categorias de Produtos', '/item_categories'))
                             }, class: 'dropdown-menu')

      capture {
        content_tag(:li, capture {
                         concat title
                         concat links
                       }, class: 'dropdown')
      }
    end

    def just_for_admin_user
      current_user.is_admin?
    end

  end
end