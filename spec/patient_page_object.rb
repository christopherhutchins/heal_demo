class Patient < Struct.new(:firstname, :lastname, :email, :pw, :confirm_pw, :phone, :zip)
  include Capybara::DSL

  def register
    fill_in 'firstname',   with: firstname
    fill_in 'lastname',    with: lastname
    fill_in 'username',    with: email
    fill_in 'password',    with: pw
    fill_in 'password2',   with: confirm_pw
    fill_in 'phonenumber', with: phone
    fill_in 'zipcode',     with: zip

    click_button "Create Account"
  end

  def register_successfully?
    within('.header-container') do
      find '.primary-blue', text: "#{firstname} #{lastname}"
    end
    
    within('#book-visit') do
      find 'h3', text: "Book Visit"
      find 'h3', text: "Is this a life-threatening medical emergency?"
    end
  end
end
