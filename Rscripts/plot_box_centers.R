## plot box centers on figure

bgmFile <- "Final_CAM_Boxes_8.bgm"


# read in using rbgm package
bgm <- rbgm::read_bgm(bgmFile)
# convert to spatial object
spdf <- rbgm::boxSpatial(bgm)
# read in using atlantis tools to get centers
bgminfo <- atlantistools::load_box(bgmFile)
# select centers and reformat
centers <- as.data.frame(t(sapply(bgminfo$boxes, "[[", "inside")))
names(centers) <- c("X","Y")
centers <- centers |> 
  tibble::rownames_to_column() |> 
  dplyr::rename(box_id = rowname) |> 
  dplyr::mutate(box_id = as.integer(box_id))

# copmbine centers to spatial object
dat <- sf::st_as_sf(spdf) |> 
  dplyr::left_join(centers,by = "box_id")
#plot
dat |> 
  ggplot2::ggplot()+
  ggplot2::geom_sf() +
  ggplot2::geom_point(ggplot2::aes(x=X,y=Y),size=0.5)

