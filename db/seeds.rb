# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
userPedro = User.create(name: 'Pedro', email: 'pedro@email.com', 
                               password: '123456')

userLeo = User.create(name: 'Leo', email: 'leo@email.com', 
                               password: '123456')

userKihare = User.create(name: 'Kihare', email: 'kihare@email.com', 
                               password: '123456')      

profilePedro = Profile.create(name: 'Pedro', sector: 'RH', region: 'SP',
                                company: 'Box', email: 'pedro@email.com',
                                user: userPedro)

profileLeo = Profile.create(name: 'Leo', sector: 'Finanças', region: 'RJ',
                                company: 'Pedra', email: 'leo@email.com',
                                user: userLeo)

profileKihare = Profile.create(name: 'Kihare', sector: 'TI', region: 'SP',
                                company: 'Box', email: 'kihare@email.com',
                                user: userKihare)    

hollywood= Product.create(name: 'Hollywood', item_desc: 'item 123', price: 199, 
                        profile: profilePedro)

Product.create([{ name: 'RiotPoints', item_desc: 'Sim Riot', 
                            price: 50, profile: profileLeo, status: 0 },
                            { name: 'ValorantPoints', item_desc: 'Sim Valorant', 
                            price: 300, profile: profileLeo, status: 5 }
                        ])

                        
Comment.create(replay: 'Azul?', profile: profileKihare, product: hollywood)

Comment.create(replay: 'Não, tabaco.', profile: profilePedro, product: hollywood)

tradingHollywood = TradingLog.create(seller_id: 1, product: hollywood,
                                        profile: profileKihare, status: 0)

comentarioKihare = LogComment.create(private_message: 'Coé, tem pra cachorro?', 
                                       profile: profileKihare, trading_log: tradingHollywood)


#Quando der select em string usar Where e não find_by

#todos = Profile.where("company like ?", "Box")
#produtos_todos = Product.where(profile: todos)