module TableOperations
  module SortingHelper

    def sortable(sort, direction, defaultvalue, column, title = nil, remote = false)
      title ||= column.titleize
      direction = (column == sort_column(sort, defaultvalue) && sort_direction(direction) == 'asc') ? 'desc' : 'asc'

      link_to title, params.merge(:sort => column, :direction => direction, :page => nil), remote: remote
    end

    def sort_column(sort, default_value)
      ''.eql?(params[sort]) ? default_value : params[sort] || default_value
    end

    def sort_direction(direction, default_direction = 'asc')
      %w(asc desc).include?(params[direction]) ? params[direction] : default_direction
    end

  end
end