require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "john", email: "john@example.com", password: "password")
  end
  
  test "create new article" do
    sign_in_as(@user, 'password')
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, 
          article: {title: "testing article", description: "this is a test article", user: @user}
    end
    assert_template 'articles/show'
    assert_match "testing article", response.body
  end
  
end