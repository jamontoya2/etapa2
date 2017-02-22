post '/create/survey' do
  hasht = []
  haste = {}
  hasht = params.values.to_a
  haste = hasht[0].to_h
  haste.size
  haste.each do |key, value|
    if key.to_i == 0
      p value
      survey_uno = Survey.create(user_id: current_user.id, survey: value[0])
    else
      i = 0
        while i <= value.size - 1 do
          if i == 0
            title = Title.create(survey_id: Survey.last.id, title: value[i]) 
          else
            choice = Choice.create(title_id: title.id, choice: value[i])   
          end
        i += 1
       end
    end
  end
end


