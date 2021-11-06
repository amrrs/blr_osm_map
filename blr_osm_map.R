# Code credit - Tanya Shapiro https://github.com/tashapiro

# OG - https://github.com/tashapiro/30DayMapChallenge/blob/main/basel-openstreetmap/basel_map.R

library(tidyverse)
library(osmdata)
library(sf)
library(showtext)


streets <- getbb("Bengaluru India")%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>%
  osmdata_sf()


small_streets <- getbb("Bengaluru India")%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street",
                            #"unclassified",
                            "service", "footway")) %>%
  osmdata_sf()



background_color<-'#1E212B'
street_color<-'#FAD399'
small_street_color<-'#D4B483'
font_color<-'#FFFFFF'


font_add_google("Quattrocento", "Quattrocento")


blr_dark<-ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = street_color,
          size = .5,
          alpha = .6) +
  
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = street_color,
          size = .3,
          alpha = .6) +

  theme_void() +
  theme(plot.title = element_text(family = 'Quattrocento',
                                  color=font_color,
                                  size = 18, face="bold", hjust=.5,
                                  vjust=2.5),
        panel.border = element_rect(colour = "white", fill=NA, size=3),
        plot.margin=unit(c(0.6,1.6,1,1.6),"cm"),
        plot.subtitle = element_text(color=font_color,
                                     family = 'Quattrocento',
                                     vjust=0.1,
                                     size = 12, hjust=.5, margin=margin(2, 0, 5, 0)),
        plot.background = element_rect(fill = "#282828")) +
  coord_sf(ylim = c(13.00, 12.94), 
           xlim = c(77.52, 77.62), 
           expand = FALSE) +
  
  labs(title = "Bengaluru, INDIA", 
       subtitle = '12.9716° N, 77.5946° E')

blr_dark

background_color2<-'#faf9ed'
street_color2<-'#13130c'
small_street_color2<-'#37261a'
font_color2<-'#13130c'

blr_light<-ggplot() +
  # geom_sf(data = river$osm_lines,
  #         inherit.aes = FALSE,
  #         color = river_color2,
  #         alpha=.5,
  #         size = .4) +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = street_color2,
          size = .4,
          alpha = .8) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = small_street_color2,
          size = .2,
          alpha = .6) +
  coord_sf(ylim = c(13.00, 12.94), 
             xlim = c(77.52, 77.62), 
             expand = FALSE) +

  theme_void() +
  theme(plot.title = element_text( family = 'Quattrocento',
                                  color=font_color2,
                                  size = 18, face="bold", hjust=0.5),
        panel.border = element_rect(colour = font_color2, fill=NA, size=3),
        plot.margin=unit(c(0.6,1.6,1,1.6),"cm"),
        plot.subtitle = element_text(color=font_color2,
                                     family = 'Quattrocento',
                                     vjust=0.2,
                                     size = 12, hjust=.5, margin=margin(2, 0, 5, 0)),
        plot.background = element_rect(fill = background_color2)) +
  labs(title = "Bengaluru, INDIA", 
       subtitle = '12.9716° N, 77.5946° E')


blr_light
  
