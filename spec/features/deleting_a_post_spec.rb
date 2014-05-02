require 'spec_helper'

feature 'Deleting a post' do

  let!(:user) { create(:user) }
  let!(:post) { create(:post) }
  
  
  before do
    post.update(user: user)
    sign_in_as!(user)
  end

  scenario do
    visit post_path(post)
    click_link 'Delete Post'
    expect(Post.count).to eq 0
    expect(current_path).to eq posts_path
    expect(page).to have_css('.alert.alert-success')
  end
end
