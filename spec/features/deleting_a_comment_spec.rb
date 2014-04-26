require 'spec_helper'

feature 'Deleting a comment' do
  #set up a post with two comments
  let!(:post) { FactoryGirl.create(:post) }
  let!(:comment1) { FactoryGirl.create(:comment, post: post) }
  let!(:comment2) { FactoryGirl.create(:comment, post: post) }

  before do
    visit '/'
    click_link post.title
end
  
  
  scenario do
    # assert we are on the Show Post page
    expect(page).to have_content("My Post")
    expect(page).to have_content("Comment 1, now with padding.")
    expect(page).to have_content("Comment 2, now with padding.")
    
    # navigate to the post that is set up for the test
    # click link to delete one of the comments
    
    click_link comment1.content
    click_link "Delete Comment"
    
    # assert that we're back on post page
    expect(page).to have_content("My Post")
    # assert that deleted comment is gone
    expect(page).to_not have_content("Comment 1, now with padding.")
    # assert that other comment is still there
    expect(page).to have_content("Comment 2, now with padding.")
  end
end
