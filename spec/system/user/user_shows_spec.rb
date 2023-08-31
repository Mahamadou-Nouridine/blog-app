require 'rails_helper'

RSpec.describe "UserShows", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'User Show page' do
    before do
      @user_1, @user_2, @user_3 = User.create([
        {
        name: 'Nouridine',
        photo: 'https://drive.google.com/file/d/13-N8SlsasURapsAjgP0D2KTnYtNGBsxO/view?usp=sharing',
        bio: 'Full Stack Web Developer',
        posts_count: 0
      },
        {
        name: 'Mahamadou',
        photo: 'https://drive.google.com/file/d/13-N8SlsasURapsAjgP0D2KTnYtNGBsxO/view?usp=sharing',
        bio: 'Rails Full Stack Web Developer',
        posts_count: 0
      },
        {
        name: 'Souley',
        photo: 'https://drive.google.com/file/d/13-N8SlsasURapsAjgP0D2KTnYtNGBsxO/view?usp=sharing',
        bio: 'Mern Full Stack Web Developer',
        posts_count: 0
      }
      ])

      @posts = @user_1.posts.create([
        {
          text: "This is the first user post",
          title: "First post",
          likes_count: 0,
          comments_count: 0
        },
        {
          text: "This is the second user post",
          title: "second post",
          likes_count: 0,
          comments_count: 0
        },
        {
          text: "This is the third user post",
          title: "third post",
          likes_count: 0,
          comments_count: 0
        },
        {
          text: "This is the fourth user post",
          title: "fourth post",
          likes_count: 0,
          comments_count: 0
        },
      ])
    end

    it "I can see the user's profile picture." do
      visit user_path(@user_1)
      expect(page).to have_xpath("//img[contains(@src,'https://drive.google.com/file/d/13-N8SlsasURapsAjgP0D2KTnYtNGBsxO/view?usp=sharing')]")
    end

    it "I can see the user's username." do
      visit user_path(@user_1)
      expect(page).to have_content("Nouridine")
    end

    it "I can see the number of posts the user has written." do
      visit user_path(@user_1)
      expect(page).to have_content("Number of post: 4")
    end

    it "I can see the user's bio." do
      visit user_path(@user_1)
      expect(page).to have_content("Full Stack Web Developer")
    end

    it "I can see the user's first 3 posts." do
      visit user_path(@user_1)
      expect(page).to have_content("his is the fourth user post")
      expect(page).to have_content("his is the third user post")
      expect(page).to have_content("his is the second user post")
      expect(page).not_to have_content("his is the first user post")
    end

    it "I can see a button that lets me view all of a user's posts." do
      visit user_path(@user_1)
      page.should have_button('See all posts')
    end

    it "When I click a user's post, it redirects me to that post's show page." do
      visit user_path(@user_1)
      click_link("post_#{@posts[3].id}_link")
      page.should have_button('Leave a comment')
    end

    it "When I click to see all posts, it redirects me to the user's post's index page" do
      visit user_path(@user_1)
      click_button("See all posts")
      expect(page).to have_content("his is the fourth user post")
      expect(page).to have_content("his is the third user post")
      expect(page).to have_content("his is the second user post")
      expect(page).to have_content("his is the first user post")
    end
  end
end
