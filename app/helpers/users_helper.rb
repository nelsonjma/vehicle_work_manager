module UsersHelper

  def users_permissions_list
    [
      #['GOD', 0],
      ['Nivel 1', 1],
      ['Nivel 2', 2],
      ['Nivel 3 - Utilizador Comum', 3]
    ]
  end

  def user_permission_name(id)
    return 'GOD' if id.eql? 0

    users_permissions_list.each do |perm|
      return perm[0] if perm[1].eql? id
    end
  end

end
