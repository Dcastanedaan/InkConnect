require "open-uri"

puts "Eliminando datos existentes..."
Like.destroy_all
Comment.destroy_all
PortfolioStyle.destroy_all
PortfolioMedium.destroy_all
Portfolio.destroy_all
TattooArtist.destroy_all
TattooStyle.destroy_all
User.destroy_all

puts "Creando admins..."
admin1 = User.create!(name: "Admin Uno", username: "admin1", email: "admin1@example.com", password: "123456", role: 2, bio: "Administrador", location: "Ciudad Admin")
admin2 = User.create!(name: "Admin Dos", username: "admin2", email: "admin2@example.com", password: "123456", role: 2, bio: "Administrador", location: "Ciudad Admin")

puts "Creando usuarios normales..."
users = []
5.times do |i|
  users << User.create!(
    name: "User #{i+1}",
    username: "user#{i+1}",
    email: "user#{i+1}@example.com",
    password: "123456",
    role: 0,
    bio: "Soy el usuario #{i+1}",
    location: "Ciudad #{i+1}"
  )
end

puts "Creando estilos de tatuaje..."
styles = %w[Realismo Tradicional OldSchool NeoTrad Minimalista Acuarela Geométrico]
tattoo_styles = styles.map { |s| TattooStyle.create!(name: s) }

puts "Creando artistas tattoo y portfolios..."
artists = []
5.times do |i|
  user = User.create!(
    name: "Artist Tattoo #{i+1}",
    username: "artisttattoo#{i+1}",
    email: "artisttattoo#{i+1}@example.com",
    password: "123456",
    role: 1,
    bio: "Especialista en estilo #{styles.sample}",
    location: "Ciudad Tattoo #{i+1}"
  )

  artist = TattooArtist.create!(
    user: user,
    studio_name: "Studio #{i+1}",
    bio: "Studio de tatuajes #{i+1}",
    location: "Barrio #{i+1}",
    instagram: "artisttattoo#{i+1}_insta",
    website: "https://artisttattoo#{i+1}.studio.com",
    hourly_rate: [40,50,60,70,80].sample
  )
  artists << artist

  # Crear 1 o 2 portfolios por artista
  rand(1..2).times do |p|
    portfolio = artist.portfolios.create!(
      title: "Portfolio #{i+1}-#{p+1}",
      description: "Descripción del portfolio #{i+1}-#{p+1}"
    )

    # Adjuntar 2 imágenes por portfolio
    2.times do |img_index|
      portfolio.images.attach(
        io: URI.open("https://picsum.photos/seed/#{i+1}-#{p+1}-#{img_index+1}/600/400"),
        filename: "portfolio_#{i+1}_#{p+1}_#{img_index+1}.jpg",
        content_type: "image/jpeg"
      )
    end

    # Crear likes aleatorios de usuarios y artistas
    ([users.sample, user] + [users.sample]).uniq.each do |u|
      Like.create!(user: u, portfolio: portfolio)
    end

    # Crear comentarios aleatorios
    ([users.sample, user] + [users.sample]).uniq.each do |u|
      Comment.create!(user: u, portfolio: portfolio, body: "Comentario de #{u.username} en #{portfolio.title}")
    end
  end
end

puts "Seed completado ✅"
