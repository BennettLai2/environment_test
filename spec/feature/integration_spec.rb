# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do 
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rolling'
    fill_in 'Price', with: 42.0
    fill_in 'Date', with: Date.new(2022,9,8)
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('J.K. Rolling')
    expect(page).to have_content(42.0)
    expect(page).to have_content(Date.new(2022,9,8))
  end

  scenario 'no name' do 
    visit new_book_path
    fill_in 'Author', with: 'J.K. Rolling'
    fill_in 'Price', with: 42.0
    fill_in 'Date', with: Date.new(2022,9,8)
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'no author' do 
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Price', with: 42.0
    fill_in 'Date', with: Date.new(2022,9,8)
    click_on 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  scenario 'no price' do 
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rolling'
    fill_in 'Price', with: 42.0
    fill_in 'Date', with: Date.new(2022,9,8)
    click_on 'Create Book'
    expect(page).to have_content("Price can't be blank")
  end

  scenario 'np date' do 
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rolling'
    fill_in 'Price', with: 42.0
    fill_in 'Date', with: Date.new(2022,9,8)
    click_on 'Create Book'
    expect(page).to have_content("Date can't be blank")
  end
end