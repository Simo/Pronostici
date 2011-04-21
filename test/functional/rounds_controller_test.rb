require 'test_helper'

class RoundsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Round.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Round.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Round.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to round_url(assigns(:round))
  end

  def test_edit
    get :edit, :id => Round.first
    assert_template 'edit'
  end

  def test_update_invalid
    Round.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Round.first
    assert_template 'edit'
  end

  def test_update_valid
    Round.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Round.first
    assert_redirected_to round_url(assigns(:round))
  end

  def test_destroy
    round = Round.first
    delete :destroy, :id => round
    assert_redirected_to rounds_url
    assert !Round.exists?(round.id)
  end
end
