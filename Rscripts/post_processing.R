#' Post processing for CAM2
#' 
#' You may need to edit the following: runname and path
#' Other fields should be left alone

####################################################
################ CHANGE THESE #######################
# The name of the folder containing atlantis output
runname <- "out"
# Path to the root of your project
path <- "mnt/NEUS-Atlantis/CAM2/"
####################################################
####################################################

# The text that preixes all of the output
run.prefix <- "CAM_output"
# Path to the output folder
atl.dir = here::here(runname)
# Path to the folder containing the input parameters
param.dir = here::here()
# Path to where processed Figures should go (folder will be created)
fig.dir <- file.path(atl.dir,'Post_Processed')
# Path to where processed Data should go (folder will be created)
out.dir <- file.path(fig.dir,'Data')

if (!require(atlantisprocessing)) {
  remotes::install_github("NOAA-EDAB/atlantisprocessing")
}
  
library(atlantisprocessing)

# gets a list of paths for all files required for processing
param.ls <- get_atl_paramfiles(param.dir,
                               atl.dir,
                               run.prefix,
                               include_catch = T)

# processes atlantis output files and creates small rds files.
# These are saved in the Data folder
process_atl_output(param.dir,
                   atl.dir,
                   out.dir,
                   run.prefix,
                   param.ls,
                   process.all = F,
                   plot.all = F,
                   plot.benthic =T,
                   plot.overall.biomass =T,
                   plot.biomass.timeseries = T,
                   plot.length.age = T,
                   plot.biomass.box=T,
                   plot.c.mum=T,
                   plot.sn.rn=T,
                   plot.recruits=T,
                   plot.numbers.timeseries=T,
                   plot.physics=T,
                   #plot.growth.cons=T,
                   #plot.cohort=T,
                   #plot.diet=T,
                   #plot.consumption= T,
                   #plot.spatial.biomass=T,
                   #plot.spatial.biomass.seasonal = T,
                   #plot.catch =T,
                   #plot.catch.fleet = T,
                   #plot.spatial.catch =T,
                   plot.mortality=T,
                   plot.weight = T,
                   #plot.spatial.overlap =T
)

# Creates figures based on the rds files created above.
# these are saved in the Figures folder
make_atlantis_diagnostic_figures(atl.dir = atl.dir,
                                 fig.dir = fig.dir,
                                 out.dir = out.dir,
                                 param.dir = param.dir,
                                 run.prefix = run.prefix,
                                 run.name = runname,
                                 
                                 benthic.box =4,
                                 benthic.level = 4,
                                 param.ls = param.ls,
                                 # bgm.file = param.ls$bgm,
                                 # group.file = param.ls$func.groups,
                                 # biol.prm = param.ls$biol.prm,
                                 plot.all = F,
                                 #Turn these on/off for desired output
                                 plot.benthic =T,
                                 plot.overall.biomass = T,
                                 plot.biomass.timeseries = T,
                                 plot.length.age = F,
                                 plot.biomass.box=T,
                                 plot.c.mum=T,
                                 plot.sn.rn=T,
                                 plot.recruits=T,
                                 plot.numbers.timeseries=T,
                                 plot.physics=T,
                                 plot.growth.cons=F,
                                 plot.cohort=F,
                                 plot.diet=F,
                                 plot.consumption= F,
                                 plot.spatial.biomass=F,
                                 plot.spatial.catch = F,
                                 plot.spatial.biomass.seasonal = F,
                                 plot.catch =F,
                                 plot.weight=T,
                                 plot.mortality=T)


