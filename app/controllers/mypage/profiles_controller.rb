# frozen_string_literal: true
class Mypage::ProfilesController < Mypage::BaseController
  def show
    #ログインしているユーザーが表示される。
    @user = current_user
  end

  def update
    #変更する場合、ログインしているユーザーidを引っ張ってくる。
    @user = User.find(current_user.id)
    #もしログインユーザーのprofile_paramsを変更された場合、
    if @user.update(profile_params)
    #マイページへリダイレクトされる
      redirect_to mypage_profile_path, success: 'プロフィールを更新しました'
    else
    #変更されなかった場合、再度マイページ画面へ戻す。
      render :show
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :avatar, :profile, :hobby)
  end
end
