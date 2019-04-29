########################################## Mardi Scraping ##########################################

# Bonjour! Voici le 2e document test d'Adrien Cloutier servant aux mardis scraping.
# Dans ce document, je tenterai de faire un ggplot, en prévision du prochain meeting.

# Bonne chance! En effet!!!
# À tous! 
# Yé!!!!!! 

# Encore un commentaire inutile pour tester Git...
# Je suis content que ça fontionne sur Slack, c'est incroyable!

########################################## 25 avril 2019 ##########################################

# D'abord, scraper les données wiki sur les albums les plus vendus au monde

########## Loaded les packages nécessaires ###########

library(ggplot2) # pour les graphiques
library(tidyverse)
library(stringr)
library(XML) 
library(RCurl)
library(maps)



########## We load the data from the webpage into R ###########

famous_album <- getURL("https://fr.wikipedia.org/wiki/Liste_des_albums_musicaux_les_plus_vendus")

tables <- readHTMLTable(famous_album, stringsAsFactors = FALSE)

########## We have a look at the data and commencer à nettoyer!  ###########

Top9_album <- tables[[2]]
names(Top9_album) <- Top9_album[1,]
Top9_album <- Top9_album[-1,]
head(Top9_album)

########## Nettoyer les données ########### 

# Utilisation de regular expression pour supprimer tout à partir du premier "[" 
# . pour tous les caracteres
# * pour jusqua la fin du string
# "" pour remplacer par rien
Top9_album$VenteMillions <- NA
Top9_album$VenteMillions <- gsub("[[].*","",Top9_album$`Ventes(en millions)`)

## Retrait de la colonne Vente(en millions)

Top9_album <- Top9_album[,-4]

########## Faire un ggplot des albums les plus vendus ###########

