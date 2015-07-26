class UsersController < ApplicationController

  helper 'table_operations/sorting'

  include TableOperations::SortingHelper

  before_action :authenticated

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    sort      = sort_column(:sort, :created_at)
    direction = sort_direction(:direction)

    @users = User.search(params[:search])
                 .order("#{sort} #{direction}")
                 .paginate(:per_page => 20, :page => params[:page])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao adicionar novo user', @user.errors.full_messages)
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao editar user', @user.errors.full_messages)
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.js   {}
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :pin, :permission, :active)
  end

end
