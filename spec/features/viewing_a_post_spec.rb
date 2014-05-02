require 'spec_helper'

feature 'Viewing a post spec' do

  let!(:user) { create(:user) }
  let!(:post) { create(:post) }
  before do
    post.update(user: user)
  end
  


  scenario do
    visit posts_path
    click_link post.title

    expect(current_path).to eq post_path(post)

    within('#title') do
      expect(page).to have_content post.title
    end
    within('#content') do
      expect(page).to have_content post.content
    end
    within('#author') do
      expect(page).to have_content post.author
    end
  end
end
