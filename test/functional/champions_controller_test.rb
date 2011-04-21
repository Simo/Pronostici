require 'test_helper'

class ChampionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Champion.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Champion.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Champion.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to champion_url(assigns(:champion))
  end

  def test_edit
    get :edit, :id => Champion.first
    assert_template 'edit'
  end

  def test_update_invalid
    Champion.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Champion.first
    assert_template 'edit'
  end

  def test_update_valid
    Champion.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Champion.first
    assert_redirected_to champion_url(assigns(:champion))
  end

  def test_destroy
    champion = Champion.first
    delete :destroy, :id => champion
    assert_redirected_to champions_url
    assert !Champion.exists?(champion.id)
  end
end
