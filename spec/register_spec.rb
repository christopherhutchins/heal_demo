require 'spec_helper'
require_relative 'patient_page_object'

describe "Register Patient", type: :feature, js: true do
  let(:firstname) { Faker::Name.first_name }
  let(:lastname)  { Faker::Name.last_name }
  let(:pw)        { Faker::Internet.password }
  let(:email)     { Faker::Internet.email }
  let(:phone)     { "818#{Faker::Number.number(7)}" }
  let(:zip)       { 91321 }

  before { visit '/register' }

  context "Given good input" do
    let(:patient) do
      Patient.new(firstname, lastname, email, pw, pw, phone, zip)
    end

    it "successfully registers patient" do
      patient.register
      expect(patient).to be_register_successfully
    end
  end

  context "Given zip code is out of coverage" do
    let(:patient) do
      Patient.new(firstname, lastname, email, pw, pw, phone, 12345)
    end

    it "prompts user before completing registration" do
      patient.register
      expect(page).to have_content "We're Not in Your Area...yet!"
      click_button "Continue"
      expect(patient).to be_register_successfully
    end
  end

  context "Given bad input" do
    shared_examples "alert on page" do |alert|
      it "alert appears, user is not registered" do
        patient.register
        expect(page).to have_selector '.alert', text: alert
      end
    end

    context "When passwords do not match" do
      let(:patient) do
        Patient.new(firstname, lastname, email, pw, "confirm_pw", phone, zip)
      end

      it_behaves_like "alert on page", "Passwords Do Not Match."
    end

    context "When password is missing" do
      let(:patient) do
        Patient.new(firstname, lastname, email, '', '', phone, zip)
      end

      it_behaves_like "alert on page", "Password Is Required"
    end

    context "When email is incomplete" do
      let(:patient) do
        Patient.new(firstname, lastname, "john.smith@", pw, pw, phone, zip)
      end

      it_behaves_like "alert on page", "Use your email as a valid username, (e.g. email@example.com)"
    end

    context "When phone number is missing" do
      let(:patient) do
        Patient.new(firstname, lastname, email, pw, pw, '', zip)
      end

      it_behaves_like "alert on page", "Phone Number Is Required."
    end

    context "When zip code is missing" do
      let(:patient) do
        Patient.new(firstname, lastname, email, pw, pw, phone, '')
      end

      it_behaves_like "alert on page", "Zipcode Is Required."
    end

    context "When first name is missing" do
      let(:patient) do
        Patient.new('', lastname, email, pw, pw, phone, zip)
      end

      it_behaves_like "alert on page", "First Name Is Required"
    end

    context "When last name is missing" do
      let(:patient) do
        Patient.new(firstname, '', email, pw, pw, phone, zip)
      end

      it_behaves_like "alert on page", "Last Name Is Required"
    end
  end
end
