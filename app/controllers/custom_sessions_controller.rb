class CustomSessionsController < Devise::SessionsController
    protected

    def after_sign_in_path_for(resource)
        # Redirige a la página de inicio o a cualquier otra ruta deseada después del inicio de sesión.
        inicio_path
    end

end
