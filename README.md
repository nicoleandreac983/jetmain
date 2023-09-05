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
