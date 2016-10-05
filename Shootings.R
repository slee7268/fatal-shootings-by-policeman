library(maps)
library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(ggmap)

fatalShootings <- read.csv("~/R Data/fatal-police-shootings-data.csv", header = TRUE)
cities <- fatalShootings$city
cities <- as.data.frame(cities)
cityState <- subset(fatalShootings, select=c("city", "state"))

blackDeaths <- filter(fatalShootings, race == "B")
asianDeaths <- filter(fatalShootings, race == "A")
whiteDeaths <- filter(fatalShootings, race == "W")
hispanicDeaths <- filter(fatalShootings, race == "H")
#is N native american and is O other? or is A meaning American indian
sum(with(fatalShootings, race == "B"))

ggplot(data = fatalShootings) +
  geom_bar(mapping = aes(x = race, y = ..prop.., group = 1, fill = "red"))

#color coded by whether victim was armed
ggplot(data = fatalShootings) +
  geom_bar(mapping = aes(x = race, color = armed, position = "identity"))

ggplot(data = fatalShootings) +
  geom_bar(mapping = aes(x = race, fill = armed), position = "dodge")

#color coded by whether victim showed any sign of mental illness
ggplot(data = fatalShootings) +
  geom_bar(mapping = aes(x = race, fill = signs_of_mental_illness))

ggplot(data = fatalShootings) +
  geom_bar(mapping = aes(x = race, fill = signs_of_mental_illness), position = "fill")

#color coded by whether victim was trying to flee
ggplot(data = fatalShootings) +
  geom_bar(mapping = aes(x = race, fill = flee))

ggplot(data = fatalShootings) +
  geom_bar(mapping = aes(x = race, fill = flee), position = "fill")

#color coded by gender
ggplot(data = fatalShootings) +
  geom_bar(mapping = aes(x = gender, fill = race))

#color coded by whether officer had body camera
ggplot(data = fatalShootings) +
  geom_bar(mapping = aes(x = race, fill = body_camera))

#color coded by threat level
ggplot(data = fatalShootings) +
  geom_bar(mapping = aes(x = race, fill = threat_level))

numberShootings<-nrow(fatalShootings)
locations <- paste(cityState$city, cityState$state)
as.character(cityState$city)
locations <- paste(cityState$city, cityState$state)

#longitude and latitude were found using this block of code to map the shootings

#geoLocations <- geocode(as.character(locations))
#geocodeLocations <- cbind(geoLocations, cityState)
#write.csv(geocodeLocations, file = "~/R Data/Geocodes.csv")

ggplot(data = states) +
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "black") +
  geom_point(data = geoLocations, aes(x= lon, y =lat, alpha = 0.8)) +
  theme(legend.position = "none")

