analyse <- data %>%
  group_by(Year) %>%
  summarise(
    Snitt = mean(Temp),
    Maks = max(Maks),
    Min = min(Min)) %>%
    mutate(Rang_snitt = order(order(Snitt, decreasing=TRUE))) %>%
    mutate(Rang_min = order(order(Min, decreasing=TRUE))) %>%
    mutate(Rang_max = order(order(Maks, decreasing=TRUE)))