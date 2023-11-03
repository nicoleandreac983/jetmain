# README

1. Definir Entidades DB.
2. Crear Proyecto rails con :
	rails new examen_nicolecampos -d postgresql
3. Configurar DB. archivo database.yml 
   username: ******
   password: *****
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
14. se crea un seed con 2 usuarios y roles definidos para probar seed.rb.
    
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
tambien en #app/controllers/maintenance_controller.rb y engine controller
before_action only: [:new, :create] do
 authorize_request(["author", "admin"])
end

y se realiza las acciones que podra realizar como admin
  before_action only: [:show, :edit, :update :destroy] do
    authorize_request(["admin"])
  end

agregamos seguridad a los controladores 
before_action :authenticate_user!

22. Crear Scaffolding para entidad o modelo type_engine, type_maintenance, town, materials. con sus fk a mantenimiento.
    rails g scaffold Engine type_engine  
    rails g scaffold Materials name 
    rails g scaffold Type_maintenance name 
    rails generate model Town name:string 


23. genero una modificacion en el modelo engine en todos los atributos
rails generate migration AddAttributesToEngine
remove_column :engines, :type_engine
    add_column :engines, :type_engine, :integer
    add_column :engines, :name, :string
    add_column :engines, :descripcion, :text
    add_column :engines, :photo, :string
24. agrego enum con los 2 tipos de motor en app/models/engine.rb.
  enum type_engine: {
    'Motor a reacción' => 0,
    'Motor turbohélice' => 1
  }
25. generamos validaciones en app/models/engine.rb.
  validates :name, presence: true, uniqueness: true, format: { with: /\A(REAC|TURBO)-\d+\z/i, message: 'debe seguir el formato REAC-n o TURBO-n' } #aca aseguro que el nombre empiece con Reac o turbo mas el signo - y un numero no importa si seescribe en mayuscula o minuscula.
  validates :descripcion, presence: true
  validates :type_engine, presence: true
  validates :photo, presence: true
26. se genera seed de ciudades y motores.
27. se genera tabla de bootstrap para ver motores en index.html
28. generar paginacion
    agregar @pagy, @engines = pagy(@engines) en engine controller
    ademas del index agregar <%= pagy_nav(@pagy) %>
    ApplicationController:
    Pagy::DEFAULT[:items] = 10
    include Pagy::Backend

ApplicationHelper:
    include Pagy::Frontend

29. se crea metodo para saber si el admin esta entrando a engines.
30. se crea seed de type de mantencion y materials
31. se general relaciones de mantencion a otras tablas.
  belongs_to :engine
  belongs_to :type_maintenance
  belongs_to :material
  belongs_to :town 
  belongs_to :user
32. se genera formulario de creacion de mantenimiento.
33. se crea las referencias a la tabla maintenence
    rails generate migration AddEngineToMaintenances engine:references
    rails generate migration AddTypeMaintenanceToMaintenances type_maintenance:references
    rails generate migration AddTownToMaintenances town:references
    rails generate migration AddMaterialToMaintenances material:references
    rails generate migration AddUserToMaintenances user:references
34. se modifican vistas de formularios,new, vista index.
35. se rellena inicio y terminos y condiciones.
36. crea relacion user con maintenance
37. se agrega paginacion a maintenance.
38. se crea un seed con 100 mantenimientos.
39.  Home y Login
    Crea una ruta en config/routes.rb para la página de inicio:
    devise_scope :user do
        root to: 'devise/sessions#new'
    end

