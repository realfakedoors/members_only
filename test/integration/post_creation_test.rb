require 'test_helper'

class PostCreationTest < ActionDispatch::IntegrationTest
  
  def setup
    @post = posts(:first_post)
    @user = users(:bojack)
  end
  
  test "create a post successfully" do
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { title:   @post.title,
                                         body:    @post.body,
                                         user_id: 1 } }
    end
  end
  
  test "view the author of a post only when logged in" do
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    follow_redirect!
    assert_template 'posts/new'
    get post_path(Post.first)
    assert_select 'h3', @user.name
    delete logout_path
    get post_path(Post.first)
    assert_select 'h3', { count: 0, text: @user.name }
  end
  
end