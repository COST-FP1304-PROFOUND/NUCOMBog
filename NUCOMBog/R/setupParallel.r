#' @title make setupParallel
#' @description Code to make setupParallel, this is needed to run the model in parallel.
#'
#' @author Jeroen Pullens
#' @param WD Working directory
#' @param climate climate input (monthly) format: year month temp prec pot evap (tab seperated)
#' @param environment environment input (yearly) format: year co2 nitrogen deposition
#' @param inival initial values of biomass
#' @param start year in which to start
#' @param end year in which to end
#' @param type which output do you want? "NEE" and/or "WTD"
#' @param parameters possibility to add own parameters, BUT is has to in a datafram format with colum names: "names" and "values", see example.
#'
#' @return a list with paths and filenames and parameter values which can be implemented in runnucomParallel
#'
#' @keywords NUCOMBog
#'
#' @examples
#' \dontrun{
#' names<-c("CO2ref","gram_Beta","sd1","sd2")
#'
#' initialParameters<-list()
#' nparvector<-50
#' for (i in 1:nparvector) initialParameters[[i]]<-data.frame(names,values=runif(n=length(names),min=c(300,0.1,0.01,0.01),max=c(500,1,1,1)))
#' test_setup<-setupParallel(mainDir="/home/jeroen/test_package/",climate="clim_1999-2013_measured.txt",environment="Env_Mer_Bleue_1999_2013.txt",inival="Inival_Mer_Bleue.txt",start=1999,end=2013,type=c("NEE","WTD"),parameters=initialParameters)
#' }

setupParallel<-function(mainDir,climate,environment,inival,start,end,type,parameters){
  setup_parameters<-list()
   for(j in 1:length(parameters)){
    setup_parameters[[j]]<-list(mainDir=paste(mainDir,"folder",j,"/",sep=""),climate=climate,environment=environment,inival=inival,start=start,end=end,par=data.frame(parameters[[j]]),type=type)
    }
  return(list(runParameters=setup_parameters))
}
