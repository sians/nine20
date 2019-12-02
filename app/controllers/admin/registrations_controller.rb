class Admin::RegistrationsController < ApplicationController
  before_action :fetch_user, only: %i[update]

  def index
    @users = User.all
  end



end
