feature 'viewing a list of bookmark' do
  scenario 'list bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "Google Facebook Github"
  end
end
