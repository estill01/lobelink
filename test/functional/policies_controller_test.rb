require 'test_helper'

class PoliciesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Policy.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Policy.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Policy.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to policy_url(assigns(:policy))
  end

  def test_edit
    get :edit, :id => Policy.first
    assert_template 'edit'
  end

  def test_update_invalid
    Policy.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Policy.first
    assert_template 'edit'
  end

  def test_update_valid
    Policy.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Policy.first
    assert_redirected_to policy_url(assigns(:policy))
  end

  def test_destroy
    policy = Policy.first
    delete :destroy, :id => policy
    assert_redirected_to policies_url
    assert !Policy.exists?(policy.id)
  end
end
