class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  def new
   super
    puts "confirmation/new"
  end

  # POST /resource/confirmation
  def create
   super
    puts "confirmation/create"
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
   super
   puts "confirmation/show"
  end

  # protected

  # The path used after resending confirmation instructions.
  def after_resending_confirmation_instructions_path_for(resource_name)
    retval = super(resource_name)
    puts "confirmation/after_resending...retval: #{retval}"
    retval
  end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
   retval = super(resource_name, resource)
   puts "confirmation/after_confirmation...retval: #{retval}"
   return retval
  end
end
