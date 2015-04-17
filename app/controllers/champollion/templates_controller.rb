require_dependency "champollion/application_controller"

module Champollion
  class TranslationsController < ApplicationController
    before_action :set_translation, only: [:show, :edit, :update, :destroy]

    # GET /translations
    def index
      @translation = Translation.all
    end

    # GET /translations/1
    def show
    end

    # GET /translations/new
    def new
      @translation = Translation.new
    end

    # GET /translations/1/edit
    def edit
    end

    # POST /translations
    def create
      @translation = Translation.new(translation_params)

      if @translation.save
        redirect_to @translation, notice: 'Translation was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /translations/1
    def update
      if @translation.update(translation_params)
        redirect_to @translation, notice: 'Translation was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /translations/1
    def destroy
      @translation.destroy
      redirect_to translation_url, notice: 'Translation was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_translation
        @template = Translation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def translation_params
        params.require(:translation).permit(:locale, :key, :value)
      end
  end
end
