require 'rails_helper'

RSpec.feature "admin crud images" do
  context 'as an admin' do
    before do
      admin_user = User.create(username: 'admin', password: 'pass', role: 1)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(admin_user)
    end

    it "I see a new image form" do
      visit new_admin_image_path
      expect(current_path).to eq(new_admin_image_path)

      expect(page).to have_content("Upload an Image")
      expect(page).to have_button("Upload Image")
    end
  end
end