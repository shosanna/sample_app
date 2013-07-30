require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the h1 'Sample App'" do
      visit root_path
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the base title" do
      visit root_path
      page.should have_selector('title',
                        :text => "Ruby on Rails Tutorial Sample App")
    end

    it "should not have a custom page title" do
      visit root_path
      page.should_not have_selector('title', :text => '| Home')
    end
  end


  describe "Help page" do
    it "should have the content 'Help'" do
      visit help_path
      page.should have_content('Help')
    end

    it "should have the right title" do
      visit help_path
      page.should have_selector('title',
        :text => "Ruby on Rails Tutorial Sample App | Help")
    end
  end


  describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path

      page.should have_content('About Us')
    end

    it "should have the right title" do
      visit about_path
      page.should have_selector('title',
        :text => "Ruby on Rails Tutorial Sample App | About")
    end
  end

  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit contact_path
      page.should have_content('Contact')
    end

    it "should have the right title" do
      visit contact_path
      page.should have_selector('title',
        :text => "Ruby on Rails Tutorial Sample App | Contact")
    end
  end

   it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    page.should have_selector 'title', text: full_title('')
    # click_link "Sign up now!"
    # page.should have_selector 'title', text: full_title('Sign up')
    # click_link "sample app"
    # page.should have_selector 'title', text: full_title('Sample app')
  end


end