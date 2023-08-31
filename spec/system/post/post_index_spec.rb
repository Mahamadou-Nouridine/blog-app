require 'rails_helper'

RSpec.describe 'PostIndices', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Post index page' do
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
                                        text: 'This is the first user post',
                                        title: 'First post',
                                        likes_count: 0,
                                        comments_count: 0
                                      },
                                      {
                                        text: 'This is the second user post',
                                        title: 'second post',
                                        likes_count: 0,
                                        comments_count: 0
                                      },
                                      {
                                        text: 'This is the third user post',
                                        title: 'third post',
                                        likes_count: 0,
                                        comments_count: 0
                                      },
                                      {
                                        text: 'This is the fourth user post',
                                        title: 'fourth post',
                                        likes_count: 0,
                                        comments_count: 0
                                      }
                                    ])

      @posts[0].comments.create(text: 'first comment', author_id: @user_2.id)
    end

    it "I can see the user's profile picture." do
      visit user_posts_path(@user_1)
      expect(page).to have_xpath("//img[contains(@src,'https://drive.google.com/file/d/13-N8SlsasURapsAjgP0D2KTnYtNGBsxO/view?usp=sharing')]")
    end

    it "I can see the user's username." do
      visit user_posts_path(@user_1)
      expect(page).to have_content('Nouridine')
    end

    it 'I can see the number of posts the user has written.' do
      visit user_posts_path(@user_1)
      expect(page).to have_content('Number of post: 4')
    end

    it "I can see a post's title." do
      visit user_posts_path(@user_1)
      expect(page).to have_content('First post')
    end

    it "I can see some of the post's body." do
      visit user_posts_path(@user_1)
      expect(page).to have_content('This is the fourth user post')
    end

    it 'I can see the first comments on a post.' do
      visit user_posts_path(@user_1)
      expect(page).to have_content('first comment')
    end

    it 'I can see how many comments and likes a post has.' do
      visit user_posts_path(@user_1)
      expect(page).to have_content('Comments: 1, Likes: 0')
    end

    it "When I click on a post, it redirects me to that post's show page." do
      visit user_posts_path(@user_1)
      click_link(@posts[0].title.to_s)
      expect(page).to have_button('Like')
    end
  end
end
