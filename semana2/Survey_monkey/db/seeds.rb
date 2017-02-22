user_uno = User.create(name: "Juan Armando Montoya Montoya", email: "juan@gmail.com", password: "123")
user_dos = User.create(name: "Yolanda Garcia Reynoso", email: "yola@gmail.com", password: "123")

survey_uno = Survey.create(user_id: user_uno.id, survey: "codea")


title_uno = Title.create(survey_id: survey_uno.id, title: "bebida favorita")
title_dos = Title.create(survey_id: survey_uno.id, title: "pelicula favorita")

choice_uno = Choice.create(title_id: title_uno.id, choice: "Cerveza")
choice_dos = Choice.create(title_id: title_uno.id, choice: "Vino Tinto")
choice_tres = Choice.create(title_id: title_uno.id, choice: "Tequila")
choice_cuatro = Choice.create(title_id: title_uno.id, choice: "Wisky")
choice_cinco = Choice.create(title_id: title_uno.id, choice: "Ron")

choice_seis = Choice.create(title_id: title_dos.id, choice: "Pulp Fiction")
choice_siete = Choice.create(title_id: title_dos.id, choice: "Natutal Born Killers")
choice_ocho = Choice.create(title_id: title_dos.id, choice: "Point Break")


