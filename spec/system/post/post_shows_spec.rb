require 'rails_helper'

RSpec.describe 'PostShows', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Post show page' do
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

    it "I can see the post's title." do
      visit user_post_path(@user_1, @posts[0])
      expect(page).to have_content('First post')
    end

    it 'I can see who wrote the post.' do
      visit user_post_path(@user_1, @posts[0])
      expect(page).to have_content("#{@posts[0].title} by #{@user_1.name}")
    end

    it 'I can see how many comments and likes it has.' do
      visit user_post_path(@user_1, @posts[0])
      expect(page).to have_content('Comments: 1, Likes: 0')
    end

    it 'I can see the post body.' do
      visit user_post_path(@user_1, @posts[0])
      expect(page).to have_content('This is the first user post')
    end

    it 'I can see the username of each commentor.' do
      visit user_post_path(@user_1, @posts[0])
      expect(page).to have_content("#{@user_2.name}: #{@posts[0].comments[0].text}")
    end
  end
end
