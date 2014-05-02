require 'spec_helper'

feature "Viewing comments" do
  before do
    user = FactoryGirl.create(:user)
    
    sign_in_as!(user)
   
    # setup everything you need - in this case, probably a good idea to set up
    # two Posts, each with 1 Comment
    post_1 = FactoryGirl.create(:post, title: "Chilling Out", content: "A relaxing day at the beach.", author: "Karl")
    FactoryGirl.create(:comment, post: post_1, content: "Looks like a fun trip, man.", author: "Michael")
    
    post_2 = FactoryGirl.create(:post, title: "Moving On", content: "Caught our flight to New Jersey", author: "Karl")
    FactoryGirl.create(:comment, post: post_2, content: "Good luck on your journey.", author: "James Bond")
  
     post_1.update(user: user)
     post_2.update(user: user)

    
    visit '/'
  end

  scenario "Viewing comments for a post" do
    # navigate to Post you want to check
    expect(page).to have_content("Chilling Out")
    expect(page).to have_content("Moving On")
    click_link "Chilling Out"
    expect(page).to have_content("Looks like a fun trip, man.")
    expect(page).to_not have_content("Moving On")
    
    click_link "Looks like a fun trip, man."
    within("#comment") do
      expect(page).to have_content("Looks like a fun trip, man.")
    end
    within("#author") do  
      expect(page).to have_content("Michael")
    end
    # assert that you'll find the comment (author and content) associated with post to which you navigated
       
    # assert that you did not find comment associated with the other post
       
  end

end


