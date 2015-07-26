module UsersHelper

  def users_permissions_list
    [
        ['Admin', 0],
        ['Utilizador', 1]
    ]
  end

  def user_permission_name(id)
    users_permissions_list.each do |perm|
      return perm[0] if perm[1].eql? id
    end
  end

end
