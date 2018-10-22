feature 'viewing a list of bookmark' do
  scenario 'list bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "http://google.com http://www.destroyallsoftware.com http://makers.tech"
  end
end
