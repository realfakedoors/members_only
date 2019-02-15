require 'test_helper'

class PostCreationTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:bojack)
    @post = posts(:first_post)
  end
  
  test "create a post successfully" do
    assert_difference 'Post.count', 1 do
      Post.create( title:   @post.title,
                   body:    @post.body,
                   user_id: @user.id )
    end
  end
  
  test "view the author of a post only when logged in" do
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_template 'posts/new'
    get post_path(Post.first)
    assert_select 'h3', @user.name
    delete logout_path
    get post_path(Post.first)
    assert_select 'h3', { count: 0, text: @user.name }
  end
  
end
