# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  def new
    binding.pry
    self.resource = resource_class.new
  end

  # POST /resource/confirmation
  def create
    binding.pry
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?
    binding.pry
    if successfully_sent?(resource)
      binding.pry
      respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
    else
      binding.pry
      respond_with(resource)
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    binding.pry
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      binding.pry
      set_flash_message!(:notice, :confirmed)
      binding.pry
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end

  protected

    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(resource_name)
      is_navigational_format? ? new_session_path(resource_name) : '/'
    end

    # The path used after confirmation.
    def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        signed_in_root_path(resource)
      else
        new_session_path(resource_name)
      end
    end

    def translation_scope
      'devise.confirmations'
    end
end