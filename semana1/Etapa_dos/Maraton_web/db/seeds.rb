user1 = User.create(name: "juan", email: "juan@gmail.com", password: 333444)
user2 = User.create(name: "raul", email: "raul@gmail.com", password: 555666)
user3 = User.create(name: "ernesto", email: "ernesto@gmail.com", password: 777888)

# round1 = Round.create(user_id: user1.id) 
# round2 = Round.create(user_id: user1.id) 

deck1 = Deck.create(theme:"Matematicas")
deck2 = Deck.create(theme:"Historia de México")
deck3 = Deck.create(theme:"Ciencia y Tecnología")


answer1 = Answer.create(answer_ok: "cinco", answer_one: "diez", answer_two: "ocho", answer_three: "cinco")  
card1 = Card.create(deck_id: deck1.id, answer_id: answer1.id, question: "suma de 3 + 2?")

answer2 = Answer.create(answer_ok: "diez", answer_one: "diez", answer_two: "cuatro", answer_three: "tres")  
card2 = Card.create(deck_id: deck1.id, answer_id: answer2.id,question: "suma de 4 + 6?")

answer3 = Answer.create(answer_ok: "once", answer_one: "once", answer_two: "cuatro", answer_three: "uno")  
card3 = Card.create(deck_id: deck1.id, answer_id: answer3.id, question: "suma de 3 + 9?")

answer4 = Answer.create(answer_ok: "cuatro", answer_one: "tres", answer_two: "cuatro", answer_three: "uno")  
card4 = Card.create(deck_id: deck1.id, answer_id: answer4.id, question: "suma de 2 + 2?")

answer5 = Answer.create(answer_ok: "Michoacan", answer_one: "Guanajuato", answer_two: "Tlaxcala", answer_three: "Michoacan")  
card5 = Card.create(deck_id: deck2.id, answer_id: answer5.id, question: "¿En qué estado de la República Mexicana vivieron, principalmente, los tarascos o purépechas?")

answer6 = Answer.create(answer_ok: "los Mayas", answer_one: "Aztecas", answer_two: "Los Mayas", answer_three: "Los Tarascos")  
card6 = Card.create(deck_id: deck2.id, answer_id: answer6.id, question: "¿Qué civilización prehispánica adoró al Dios Kukulkán?")

answer7 = Answer.create(answer_ok: "10 años", answer_one: "11 Años", answer_two: "10 años", answer_three: "12 Años")  
card7 = Card.create(deck_id: deck2.id, answer_id: answer7.id, question: "¿Años que duro la guerra de independencia ?")

answer8 = Answer.create(answer_ok: "Cuitlahuac", answer_one: "Moctezuma Ilhuicamina", answer_two: "Cuitlahuac", answer_three: "Guaicaipuro")  
card8 = Card.create(deck_id: deck2.id, answer_id: answer8.id, question: "¿Fue un héroe de la resistencia indígena contra los conquistadores españoles del siglo XVI?")

answer9 = Answer.create(answer_ok: "Apolo 11", answer_one: "Apolo 12", answer_two: "Apolo 9", answer_three: "Apolo 11")  
card9 = Card.create(deck_id: deck3.id, answer_id: answer9.id, question: "¿En cuál de las misiones del programa Apolo, viajó por primera vez el Hombre a la Luna?")

answer10 = Answer.create(answer_ok: "Vitamina C", answer_one: "Vitamina B", answer_two: "Vitamina C", answer_three: "Vitamina B12")  
card10 = Card.create(deck_id: deck3.id, answer_id: answer10.id, question: "¿Con qué nombre común se conoce el ácido ascórbico?")

answer11 = Answer.create(answer_ok: "Sustraendo", answer_one: "Dividendo", answer_two: "Coseno", answer_three: "Sustraendo")  
card11 = Card.create(deck_id: deck3.id, answer_id: answer11.id, question: "¿El número que se resta al minuendo se llama?")

answer12 = Answer.create(answer_ok: "Ninguno", answer_one: "Ninguno", answer_two: "4", answer_three: "6")  
card12 = Card.create(deck_id: deck3.id, answer_id: answer12.id, question: "¿Cuántos lados iguales tiene un triángulo escaleno?")












