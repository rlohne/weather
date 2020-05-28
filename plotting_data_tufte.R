tic()
p <- ggplot(Past, aes(newDay, Temp)) +
  theme(plot.background = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.ticks = element_blank(),
        #axis.text = element_blank(),  
        axis.title = element_blank()) +
  geom_linerange(Past, mapping=aes(x=newDay, ymin=lower, ymax=upper), colour = "#CCD1D1")

#print(p)


p <- p + 
  geom_linerange(Past, mapping=aes(x=newDay, ymin=avg_lower, ymax=avg_upper), colour = "#939598")

#print(p)


p <- p + 
  geom_line(Present, mapping=aes(x=newDay, y=Temp, group=1)) +
  geom_vline(xintercept = 0, colour = "#000000", linetype=1, size=1)

#print(p)

p <- p + 
  geom_hline(yintercept = -20, colour = "white", linetype=1) +
  geom_hline(yintercept = -10, colour = "white", linetype=1) +
  geom_hline(yintercept = 0, colour = "white", linetype=1) +
  geom_hline(yintercept = 10, colour = "white", linetype=1) +
  geom_hline(yintercept = 20, colour = "white", linetype=1) +
  geom_hline(yintercept = 30, colour = "white", linetype=1) +
  geom_hline(yintercept = 40, colour = "white", linetype=1) 
  

#print(p)

p <- p + 
  geom_vline(xintercept = 31, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 59, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 90, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 120, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 151, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 181, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 212, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 243, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 273, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 304, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 334, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 365, colour = "wheat4", linetype=3, size=.5) 

#print(p)

p <- p +
  coord_cartesian(ylim = c(-20,40)) +
  scale_y_continuous(breaks = seq(-20,40, by=5), labels = a) +
  scale_x_continuous(expand = c(0, 0), 
                     breaks = c(15,45,75,105,135,165,195,228,258,288,320,350),
                     labels = c("Januar", "Februar", "Mars", "April",
                                "Mai", "Juni", "Juli", "August", "September",
                                "Oktober", "November", "Desember"))

#print(p)


p <- p +
  geom_point(data=PresentLows, aes(x=newDay, y=Temp), colour="blue3") +
  geom_point(data=PresentHighs, aes(x=newDay, y=Temp), colour="firebrick3")

#print(p)

p <- p +
  ggtitle("Bergen (Florida) i 2019 vs. 1960-2018") +
  theme(plot.title=element_text(face="bold",hjust=.012,vjust=.8,colour="#3C3C3C",size=20)) +
  annotate("text", x = 11, y = 40, label = "Temperatur", size=4, fontface="bold")

#print(p)
p <- p + 
  annotate("text", x = 50.40, y = 38, label = "Grafen viser snittemperatur per dag fra 1960 til 2018 (lyse farger), samt data for 2019 (sort linje). Røde punkter viser",, size=3, colour="gray30")+
  annotate("text", x = 42.5, y = 37, label = "de varmeste dagene i perioden, og de blå de kaldeste. Snittemperaturen for 2019 var 8.9 grader, ",, size=3, colour="gray30")+
  annotate("text", x = 50, y = 36, label = "som gjør det til det det femte varmeste året siden 1960. 2019 var og året med høyest makstemperatur, 33.7 grader",, size=3, colour="gray30")+
  annotate("text", x = 54.75, y = 35, label = "2019 scorer også høyt på listen over de 'varmeste' minimumsteperaturene (4.varmest) der laveste temperatur var -5.2 grader. ", size=3, colour="gray30")


p <- p +
  annotate("segment", x = 314, xend = 305, y = -2, yend = -10, colour = "blue3") +
  annotate("text", x = 310, y = -11, label = "Det var 5 dager i 2019", size=4, colour="blue3") +
  annotate("text", x = 315, y = -12, label = "som av de kaldeste siden 1960", size=4, colour="blue3") +
  annotate("segment", x = 207, xend = 215, y = 24, yend = 30, colour = "firebrick3") +
  annotate("text", x = 231, y = 33, label = "Det var 18 dager i 2019 som", size=4, colour="firebrick3") +
  annotate("text", x = 230, y = 32, label = "var de varmeste siden 1960", size=4, colour="firebrick3")
  

p <- p + 
  labs(caption = "Datakilde: https://seklima.met.no/observations/ , Bergen Florida 1960-2019, Grafikk: Robert Lohne (@robertlohne), Inspirasjon: Edward Tufte, kode tilpasset etter Brad Boehmke.")
  
print(p)

toc()

ggsave("Florida_2019.png", p)