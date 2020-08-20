# where I'm gonna write the seed data for my program 

vic = User.create(email: "victorwilliams1030@gmail.com", image_url: "https://i.pinimg.com/originals/3a/42/b1/3a42b1531ac93a9d12bd545b6699d036.jpg", bio: "billionaires shouldn't exist", password: "vic123")

jai = User.create(email: "jai@jai.com", image_url: "https://img-9gag-fun.9cache.com/photo/aQR3ZNz_700bwp.webp", bio: "black trans lives matter", password: "jai123")

Post.create(title: "do yall know when the live action of ATLA is coming out?", image_url: "https://i.pinimg.com/originals/f3/2f/0c/f32f0c120c8b6926941f22f818de1f18.png", description: "I've heard the creators left the production team over issues with Netflix. Does that mean the live action won't happen?", user_id: jai.id)

Post.create(title: "Capitalism. Let's talk about it.", image_url: "https://qph.fs.quoracdn.net/main-qimg-1e2b8cb47399d46f930d5d4cc9d4b345", description: "I believe socialism is the way to go. Open to thoughts!", user_id: vic.id)