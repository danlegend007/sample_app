require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @inactive_user  = users(:inactive)
    @activated_user = users(:archer)
  end
end
