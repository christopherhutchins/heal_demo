require 'spec_helper'

describe "Register Patient", type: :feature, js: true do
  let(:firstname) { Faker::Name.first_name }
  let(:lastname)  { Faker::Name.last_name }
  let(:pw)        { Faker::Internet.password }
  let(:email)     { Faker::Internet.email }
  let(:phone)     { "818#{Faker::Number.number(7)}" }
  let(:zip)       { 91321 }

  before { visit '/register' }

  context "Given good input" do
    it "successfully registers patient" do
      fill_out_and_submit_form(firstname, lastname, email, pw, pw, phone, zip)
      expect(page).to have_selector '#book-visit'
      expect(page).to have_content "Book Visit"
      expect(page).to have_content "Is this a life-threatening medical emergency?"
    end
  end

  context "Given bad input" do
    shared_examples "alert on page" do |alert|
      it "alert appears, user is not registered" do
        expect(page).to have_selector '.alert', text: alert
      end
    end

    context "When passwords do not match" do
      before do
        fill_out_and_submit_form(firstname, lastname, email, pw, "confirm_pw", phone, zip)
      end

      it_behaves_like "alert on page", "Passwords Do Not Match."
    end

    context "When password is missing" do
      before do
        fill_out_and_submit_form(firstname, lastname, email, '', '', phone, zip)
      end

      it_behaves_like "alert on page", "Password Is Required"
    end

    context "When email is incomplete" do
      before do
        fill_out_and_submit_form(firstname, lastname, "john.smith@", pw, pw, phone, zip)
      end

      it_behaves_like "alert on page", "Use your email as a valid username, (e.g. email@example.com)"
    end

    context "When phone number is missing" do
      before do
        fill_out_and_submit_form(firstname, lastname, email, pw, pw, '', zip)
      end

      it_behaves_like "alert on page", "Phone Number Is Required."
    end

    context "When zip code is missing" do
      before do
        fill_out_and_submit_form(firstname, lastname, email, pw, pw, phone, '')
      end

      it_behaves_like "alert on page", "Zipcode Is Required."
    end

    context "When first name is missing" do
      before do
        fill_out_and_submit_form('', lastname, email, pw, pw, phone, zip)
      end

      it_behaves_like "alert on page", "First Name Is Required"
    end

    context "When last name is missing" do
      before do
        fill_out_and_submit_form(firstname, '', email, pw, pw, phone, zip)
      end

      it_behaves_like "alert on page", "Last Name Is Required"
    end
  end

  def fill_out_and_submit_form(firstname, lastname, email, pw, confirm_pw, phone, zip)
    fill_in 'firstname',   with: firstname
    fill_in 'lastname',    with: lastname
    fill_in 'username',    with: email
    fill_in 'password',    with: pw
    fill_in 'password2',   with: confirm_pw
    fill_in 'phonenumber', with: phone
    fill_in 'zipcode',     with: zip

    click_button "Create Account"
    # binding.pry
  end


end
