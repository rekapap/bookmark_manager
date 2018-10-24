feature 'viewing a list of bookmark' do
  scenario 'list bookmarks' do
    bookmark = add_web_bookmarks
    visit '/bookmarks'
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
