require 'spec_helper'
require 'pry'

module Champollion
  RSpec.describe TranslationsController, :type => :controller do
    routes { Champollion::Engine.routes }

    # This should return the minimal set of attributes required to create a valid
    # Translation. As you add validations to Translation, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      {
        locale: :en,
        key: 'home.button',
        value: 'Hello'
      }
    }

    let(:invalid_attributes) {
      {
        locale: :en
      }
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # TranslationsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all translations as @translations" do
        translation = Translation.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:translations)).to eq([translation])
      end
    end

    describe "GET show" do
      it "assigns the requested translation as @translation" do
        translation = Translation.create! valid_attributes
        get :show, {:id => translation.to_param}, valid_session
        expect(assigns(:translation)).to eq(translation)
      end
    end

    describe "GET new" do
      it "assigns a new translation as @translation" do
        get :new, {}, valid_session
        expect(assigns(:translation)).to be_a_new(Translation)
      end
    end

    describe "GET edit" do
      it "assigns the requested translation as @translation" do
        translation = Translation.create! valid_attributes
        get :edit, {:id => translation.to_param}, valid_session
        expect(assigns(:translation)).to eq(translation)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Translation" do
          expect {
            post :create, {:translation => valid_attributes}, valid_session
          }.to change(Translation, :count).by(1)
        end

        it "assigns a newly created translation as @translation" do
          post :create, {:translation => valid_attributes}, valid_session
          expect(assigns(:translation)).to be_a(Translation)
          expect(assigns(:translation)).to be_persisted
        end

        it "redirects to the created translation" do
          post :create, {:translation => valid_attributes}, valid_session
          expect(response).to redirect_to(Translation.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved translation as @translation" do
          post :create, {:translation => invalid_attributes}, valid_session
          expect(assigns(:translation)).to be_a_new(Translation)
        end

      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          {
            locale: :en,
            key: 'home.button',
            value: 'New value'
          }
        }

        it "updates the requested translation" do
          translation = Translation.create! valid_attributes
          put :update, {:id => translation.to_param, :translation => new_attributes}, valid_session
          translation.reload
          expect(translation.value).to eq("New value")
        end

        it "assigns the requested translation as @translation" do
          translation = Translation.create! valid_attributes
          put :update, {:id => translation.to_param, :translation => valid_attributes}, valid_session
          expect(assigns(:translation)).to eq(translation)
        end

        it "redirects to the translation" do
          translation = Translation.create! valid_attributes
          put :update, {:id => translation.to_param, :translation => valid_attributes}, valid_session
          expect(response).to redirect_to(translation)
        end
      end

      describe "with invalid params" do
        it "assigns the translation as @translation" do
          translation = Translation.create! valid_attributes
          put :update, {:id => translation.to_param, :translation => invalid_attributes}, valid_session
          expect(assigns(:translation)).to eq(translation)
        end

        it "re-renders the 'edit' translation" do
          translation = Translation.create! valid_attributes
          put :update, {:id => translation.to_param, :translation => invalid_attributes}, valid_session
          expect(response).to redirect_to(translation)
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested translation" do
        translation = Translation.create! valid_attributes
        expect {
          delete :destroy, {:id => translation.to_param}, valid_session
        }.to change(Translation, :count).by(-1)
      end

      it "redirects to the translations list" do
        translation = Translation.create! valid_attributes
        delete :destroy, {:id => translation.to_param}, valid_session
        expect(response).to redirect_to(translations_url)
      end
    end

  end
end
