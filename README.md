# README

1. Definir Entidades DB.
2. Crear Proyecto rails con :
	rails new examen_nicolecampos -d postgresql
3. Configurar DB. archivo database.yml 
   username: userdb
   password: ror2023
   host: localhost
   port: 5432
4. Probar conexion DB:
	rails db:create
5. Instalacion de Gemas:
	bundle add devise faker pagy 
6. Instalar Estructura Devise
	rails generate devise:install
7. Instalar customizacion de componentes Devise
	rails g devise:views
8. Generar usuario device:
	rails generate devise user
9. Crear en schema DB:
	rails db:migrate
10. Agregamos Bootsrap a nuestro application.html.erb
	- Importacion por CDN
11. Generar 3 vistas estaticas Inicio sin login,inicio con login  y terminos y condiciones
    rails generate controller Pages inicio terminos
12. se modifica routes para que al abrir pagina abra desde el login de devise
     root 'devise/sessions#new'
13. luego de iniciar sesion se lleva a la vista de inicio se genera controlador para hacer el controlador de sesiones.
    rails generate controller CustomSessions
14. validacion de inicio de sesion en app/models/user.rb

15. Creacion navbar carpeta shared en views
16.  Agregamos Inicio y cierre de sesión. config/initializer/devise.rb
 Debemos modificar los formatos navigacionales de devise 

17. Crear Scaffolding para entidad o modelo maintenance . 
    rails g scaffold Maintenance name_engine photo email
18. agregamos roles de usuarios en devise
    rails g migration AddRoleToUsers role:integer
19. antes de migrar hare la modificacion del role en la migracion
    add_column :users, :role, :integer, default: 0
20. Configuramos Enum para los roles de usuario.
    app/models/user.rb
enum :role, [:operator, :admin]
21. Solo los operadore y administradores pueden crear un mantenimiento.
Creamos método para verificar el tipo de usuario
#app/controllers/application_controller.rb
def authorize_request(kind = nil)
 unless kind.include?(current_user.role)
 redirect_to posts_path, notice: "You are not authorized to perform this action"
 end
end
tambien en #app/controllers/posts_controller.rb
before_action only: [:new, :create] do
 authorize_request(["author", "admin"])
end

y se realiza las acciones que podra realizar como admin
  before_action only: [:show, :edit, :update :destroy] do
    authorize_request(["admin"])
  end

17. agregamos seguridad a los controladores 
before_action :authenticate_user!


