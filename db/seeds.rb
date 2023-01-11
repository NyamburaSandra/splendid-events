#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "seeding..."
Client.destroy_all
Location.destroy_all
Event.destroy_all
Sponsor.destroy_all


1.times do

    client1 = Client.create(
    {
    client_name: "Martin Deporres", 
    client_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgfTvKmQZl3ojuF0C4gijNXjYZPGvmmpsxSg&usqp=CAU",
    email: "martin@gmail.com",
    is_admin: false,
    bought_tickets: 0,
    password: "eekjuice",
    password_confirmation: "eekjuice"
    })

    location1 = Location.create({
        location_name: "Nairobi"
    })

    event1=Event.create({
    event_name:"Afro Centrique Fest", 
    event_card_image: "https://i.pinimg.com/736x/89/63/9d/89639d41db2b2bba74840e22dd16c12f.jpg",
    description:"The AfroFest supports local African Culture makers by building awareness for local artists and businesses that uphold African culture on a daily basis.
    We provide an online platform for artists and traders to showcase their work and reach additional customers. Our action builds towards an inclusive festival during Heritage weekend in South Africa (24th September every year) catering for all African entertainment across Cape Town (Covid permitting).", 
    date: "Feb/14/2023",
    time: "2:00Pm - 10:00Pm",
    category: "Festivals",
    runs_till: "Feb/16/2023",
    location_id: location1.id,
    ticket_regular: 1500,
    ticket_vip: 2200,
    ticket_vvip:3500,
    rating: 3.5,
    available_tickets: 500
})

    
    event1.event_images.create({
        image_url: "data:image/jpeg;base64,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"
    })

    Comment.create({
        content: "Looks cool",
        client_id: client1.id,
        event_id: event1.id
    })

    sponsor1 = Sponsor.create({
        sponsor_name: "CocaCola",
        sponsor_image: "data:image/png;base64,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"
    })

    entertainer1 = Entertainer.create({
        entertainer_name: "Sauti Sol",
        entertainer_image: "data:image/jpeg;base64,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",
        entertainer_description: "Sauti Sol is a Kenyan band formed in Nairobi, Kenya, by vocalists Bien-Aimé Baraza, Willis Chimano and Savara Mudigi in 2005. Initially an a cappella group, guitarist Polycarp Otieno joined before they named themselves Sauti Sol."
    })

    EventSponsor.create({
        sponsor_id: sponsor1.id,
        event_id: event1.id
    })

    EventEntertainer.create({
        event_id: event1.id,
        entertainer_id: entertainer1.id
    })

    Contact.create({
        contact_name: "Zuri",
        contact_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnzNmvg0rr0WhaBy9aepfv9z1s4Jb2YHEeHw&usqp=CAU",
        contact_tel: "+254745693831",
        event_id: event1.id
    })

    end

    puts "...done seeding"