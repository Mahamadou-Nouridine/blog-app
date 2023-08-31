require 'rails_helper'

RSpec.describe 'UserIndices', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'user index page' do
    # let(:person) do
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

      @user_1.posts.create(text: 'This is the first user post', title: 'First post', likes_count: 0, comments_count: 0)
    end

    it 'shows the users names' do
      visit '/'
      expect(page).to have_content('Mahamadou')
      expect(page).to have_content('Nouridine')
      expect(page).to have_content('Souley')
    end

    it 'I can see the profile picture for each user.' do
      visit '/'
      expect(page).to have_xpath("//img[contains(@src,'https://drive.google.com/file/d/13-N8SlsasURapsAjgP0D2KTnYtNGBsxO/view?usp=sharing')]")
    end

    it 'I can see the number of posts each user has written.' do
      visit '/'
      expect(page).to have_content('Number of post: 1')
    end

    it "When I click on a user, I am redirected to that user's show page." do
      visit '/'
      click_link('link-to-Nouridine', match: :first)
      expect(page).to have_content('Bio')
    end
  end
end
