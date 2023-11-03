# Usuario admin 
admin_user = User.create!(
    email: 'admin@example.com',
    password: '123456',
    role: "admin"
)
operador_user = User.create!(
    email: 'operator@example.com',
    password: '123456',
    role: "operator"
)

#ciudades
ciudad_1 = Town.create!(
    name: 'Arica'
)
ciudad_2 = Town.create!(
    name: 'Iquique'
)
ciudad_3 = Town.create!(
    name: 'Antofagasta'
)
ciudad_4 = Town.create!(
    name: 'Copiapo'
)
ciudad_5 = Town.create!(
    name: 'La Serena'
)
ciudad_6 = Town.create!(
    name: 'Valparaíso'
)
ciudad_7 = Town.create!(
    name: 'Santiago'
)
ciudad_8 = Town.create!(
    name: 'Rancagua'
)
ciudad_9 = Town.create!(
    name: 'Talca'
)
ciudad_10 = Town.create!(
    name: 'Concepción'
)
ciudad_11 = Town.create!(
    name: 'Temuco'
)
ciudad_12 = Town.create!(
    name: 'Valdivia'
)
ciudad_13 = Town.create!(
    name: 'Puerto Montt'
)
ciudad_14 = Town.create!(
    name: 'Coyhaique'
)
ciudad_15 = Town.create!(
    name: 'Magallanes'
)

#Motores
10.times do |o|
    Engine.create!(
        name: "REAC-#{o + 1}",
        descripcion: Faker::Vehicle.car_options,
        type_engine: Engine.type_engines.keys.sample,
        photo: "https://static.vecteezy.com/system/resources/previews/004/596/067/non_2x/car-engine-turbo-symbol-concept-in-cartoon-illustration-vector.jpg"
    )
end
10.times do |i|
    Engine.create!(
        name: "TURBO-#{i + 1}",
        descripcion: Faker::Vehicle.car_options,
        type_engine: Engine.type_engines.keys.sample,
        photo: "https://static.vecteezy.com/system/resources/previews/000/372/659/non_2x/hot-rod-race-car-engine-cartoon-lots-of-chrome-vector-illustration.jpg"
    )
end

#tipo mantenimiento
tipo_uno =  TypeMaintenance.create(
    name: "Preventivo"
)

tipo_dos =  TypeMaintenance.create(
    name: "Correctivo"
)
#Materiales
material_uno = Material.create(
    name: "Turbinas"
)
material_dos = Material.create(
    name: "Sistemas de ignición"
)
material_tres = Material.create!(
    name: "Sistemas de combustible"
)

#mantenimientos
50.times do |e|
    Maintenance.create(
        name_engine: "REAC-#{e + 1}",
        photo: Faker::LoremFlickr.image(size: "100x100"),
        email: "operador#{e + 1}@mail.com",
        engine: Engine.all.sample,
        material: Material.all.sample,
        town: Town.all.sample,
        type_maintenance: TypeMaintenance.all.sample,
        user: User.all.sample
    )
end

50.times do |c|
    Maintenance.create(
        name_engine: "TURBO-#{c + 1}",
        photo: Faker::LoremFlickr.image(size: "100x100"),
        email: "operador#{c + 1}@mail.com",
        engine: Engine.all.sample,
        material: Material.all.sample,
        town: Town.all.sample,
        type_maintenance: TypeMaintenance.all.sample,
        user: User.all.sample
    )
end