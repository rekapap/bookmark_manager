feature 'viewing a list of bookmark' do
  scenario 'list bookmarks' do
    add_web_bookmarks
    visit '/bookmarks'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end
