require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  def setup
    @contact = contacts(:one)
    @contact2 = contacts(:two)
  end

  def count_contacts
    Contact.count
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should route to new" do
    get :new
    assert_response :success
  end

  test "should create a new contact" do
    contact = Contact.new(first_name: @contact.first_name,
                          last_name: @contact.last_name,
                          birthday: @contact.birthday)
    contact.save
    assert contact.save
  end

  test "should render new if document can not be saved" do
    post :create, contact:{first_name: @contact2.first_name}
    assert_template :new
  end

  test "does edit route get called" do
    get :edit, id: @contact.id
    assert_response :success
  end

  test "should update a contact" do
    contact = contacts(:one)
    patch :update, contact:{first_name: "Bob"}, id: contact.id
    contact.reload
    assert_equal "Bob", contact.first_name
  end

  test "does show route get called" do
    get :show, id: @contact.id
    assert_response :success
  end

  test "does a contact get destroyed on delete" do
    post_delete = count_contacts - 1
    contact = contacts(:two)
    delete :destroy, id: contact.id
    assert_equal count_contacts, post_delete
  end
end
