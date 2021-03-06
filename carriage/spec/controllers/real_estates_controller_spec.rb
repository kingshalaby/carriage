require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe RealEstatesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # RealEstate. As you add validations to RealEstate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.build(:real_estate).attributes
  }

  let(:invalid_attributes) {
    FactoryBot.build(:real_estate, street: nil).attributes
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RealEstatesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
  
    before(:each) { 
    
      FactoryBot.create(:real_estate, category: "Condo", price: 55000, sq_ft: 150)
      FactoryBot.create(:real_estate, category: "Residential", price: 90000, sq_ft: 300)
      FactoryBot.create(:real_estate, category: "Residential", price: 120000, sq_ft: 5000) 
    }
    
    it "returns a success response" do
    
      real_estate = RealEstate.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
    
    it "returns paginated results" do 
      30.times {FactoryBot.create(:real_estate)}
      get :index, params: {}, session: valid_session
      expect(assigns(:real_estates).length).to eq RealEstate.per_page
    end
    
    it "filters according to category" do
      get :index, params: {}, session: valid_session
      expect(assigns(:real_estates).count).to eq 3
      
      get :index, params: {category: "Residential"}, session: valid_session
      expect(assigns(:real_estates).count).to eq 2
    end
    
    
    it "filters according to price" do
      
      
      get :index, params: {}, session: valid_session
      expect(assigns(:real_estates).count).to eq 3
      
      get :index, params: {price_min: 60000}, session: valid_session
      expect(assigns(:real_estates).count).to eq 2
      
      get :index, params: {price_max: 100000}, session: valid_session
      expect(assigns(:real_estates).count).to eq 2
      
      get :index, params: {price_min: 60000, price_max: 100000}, session: valid_session
      expect(assigns(:real_estates).count).to eq 1
    end
    
  end

  describe "GET #show" do
    it "returns a success response" do
      real_estate = RealEstate.create! valid_attributes
      get :show, params: {id: real_estate.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      real_estate = RealEstate.create! valid_attributes
      get :edit, params: {id: real_estate.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RealEstate" do
        expect {
          post :create, params: {real_estate: valid_attributes}, session: valid_session
        }.to change(RealEstate, :count).by(1)
      end

      it "redirects to the created real_estate" do
        post :create, params: {real_estate: valid_attributes}, session: valid_session
        expect(response).to redirect_to(RealEstate.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {real_estate: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryBot.build(:real_estate).attributes
      }

      it "updates the requested real_estate" do
        real_estate = RealEstate.create! valid_attributes
        put :update, params: {id: real_estate.to_param, real_estate: new_attributes}, session: valid_session
        real_estate.reload
        
      end

      it "redirects to the real_estate" do
        real_estate = RealEstate.create! valid_attributes
        put :update, params: {id: real_estate.to_param, real_estate: valid_attributes}, session: valid_session
        expect(response).to redirect_to(real_estate)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        real_estate = RealEstate.create! valid_attributes
        put :update, params: {id: real_estate.to_param, real_estate: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested real_estate" do
      real_estate = RealEstate.create! valid_attributes
      expect {
        delete :destroy, params: {id: real_estate.to_param}, session: valid_session
      }.to change(RealEstate, :count).by(-1)
    end

    it "redirects to the real_estates list" do
      real_estate = RealEstate.create! valid_attributes
      delete :destroy, params: {id: real_estate.to_param}, session: valid_session
      expect(response).to redirect_to(real_estates_url)
    end
  end

end
