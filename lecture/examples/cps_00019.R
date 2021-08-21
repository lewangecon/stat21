# NOTE: To load data, you must download both the extract's data and the DDI
# and also set the working directory to the folder with these files (or change the path below).

if (!require("ipumsr")) stop("Reading IPUMS data into R requires the ipumsr package. It can be installed using the following command: install.packages('ipumsr')")

# A DDI object (loaded with read_ipums_ddi), 
# a data.frame with ipums metadata attached, or a single column from an ipums data.frame.
ddi <- read_ipums_ddi("cps_00019.xml")
data <- read_ipums_micro(ddi)
