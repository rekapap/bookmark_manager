feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'user1')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, user1"
    expect(page).to have_content "You have registered with this email address: test@example.com"
  end
end
