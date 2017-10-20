class JoinsController < ApplicationController

  def create
    Join.create join_params
    redirect_to groups_path
  end  

  def destroy
    @group = Group.find(params[:@group_id])
    @join = Join.where(user: current_user, group: @group)
    @join.destroy(@join)
    redirect_to groups_path
  end

  private
    def join_params
      params.require(:join).permit(:group_id).merge(user: current_user)
    end
end