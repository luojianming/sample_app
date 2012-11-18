require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    before { visit root_path }
     it "should have the content 'Sample App'" do
      page.should have_content('Sample App')
    end

     it "should have the base title" do
       page.should have_selector('title', text:  full_title(''))
     end

     it "should not have a custom page title" do
       page.should_not have_selector('title', :text => full_title('Home'))
     end

     describe "for signed-in users" do
       let(:user) { FactoryGirl.create(:user) }
       before do
         FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
         FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
         sign_in user
         visit root_path
       end
       it "should render the user's feed" do
         user.feed.each do |item|
           page.should have_selector("li##{item.id}", text: item.content)
         end
        end
       end
     end

  describe "Help page" do
    before { visit help_path }
    it "should have the content 'Help'" do
      page.should have_content('Help')
    end

     it "should have the right title" do
       page.should have_selector('title',:text => full_title('Help'))
     end
  end

  describe "About page" do
    before { visit about_path }
    it "should have the content 'About Us'" do
      page.should have_content('About Us')
    end


     it "should have the right title" do
       page.should have_selector('title',:text => full_title("About us"))
     end
  end

  describe "Contact us" do
    before { visit contact_path }
    it "should have the right title" do
      page.should have_selector('title',
                                :text => full_title("Contact us"))
    end
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact us')
    click_link "Home"
    page.should have_selector 'title', text: full_title('')
  end
end
