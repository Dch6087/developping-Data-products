shinyUI(pageWithSidebar(
        headerPanel("Titanic - would you have survived ?"),
        
        mainPanel(
                h3('Remember the 1st episod of the famous drama Downton Abbey?'),
                h5('The direct heir of the domain, Patrick Crawley, died in the titanic shipwerck, launching the inheritance saga.'),
                h5('Was he unlucky ?'),
                h5('By analyzing the list of survived/death passengers, try to simulate your chance of survival.'),
                
                sliderInput('Age', 'How old are you ?',value = 40, min = 0, max = 80, step = 1),
                sliderInput('Family', 'How many relatives do you have on board ?',value = 1, min = 0, max = 8, step = 1),
                radioButtons('Gender', 'What is your gender ?', c('male' = 1, 'female' = 2)),
                radioButtons('Class', 'On which class do you travel ?', c("1st" = 1, "2nd" = 2, "3rd" = 3))
        ),
        
        sidebarPanel(
                textOutput('mytext'),
                plotOutput('mypie')
        )
))