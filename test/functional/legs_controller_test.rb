require 'test_helper'

class LegsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Leg.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Leg.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Leg.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to leg_url(assigns(:leg))
  end

  def test_edit
    get :edit, :id => Leg.first
    assert_template 'edit'
  end

  def test_update_invalid
    Leg.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Leg.first
    assert_template 'edit'
  end

  def test_update_valid
    Leg.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Leg.first
    assert_redirected_to leg_url(assigns(:leg))
  end

  def test_destroy
    leg = Leg.first
    delete :destroy, :id => leg
    assert_redirected_to legs_url
    assert !Leg.exists?(leg.id)
  end
end
