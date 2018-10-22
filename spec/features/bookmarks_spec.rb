feature 'viewing a list of bookmark' do
  scenario 'list bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://google.com'
    expect(page).to have_content 'http://makers.tech'
  end
end
