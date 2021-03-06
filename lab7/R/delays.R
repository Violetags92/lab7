
visualize_airport_delays <- function(){
  data("airports")
  data("flights")
  airports_filter <- filter(airports, dst == "A")
  flights_filter <- filter(flights, month >= 3)
  flights_filter <- filter(flights, month <= 11)
  flights_filter <- filter(flights, month == 3 & day >= 11)
  flights_filter <- filter(flights, month == 11 & day <= 3)
  airports_select <- select(airports_filter, one_of(c("faa","lat","lon")))
  flights_select <- select(flights_filter, one_of(c("dest", "dep_delay", "arr_delay")))
  all_dest <- inner_join(flights_select, airports_select, by =c("dest" = "faa"))
  a <- summarise(group_by(all_dest, dest), m=mean(dep_delay, na.rm = TRUE), lat=mean(lat), lon=mean(lon))
  q <- ggplot(a, aes(x= lon, y =lat))+geom_point()+geom_text(aes(label=m),hjust=0, vjust=0)
  return(q)
}