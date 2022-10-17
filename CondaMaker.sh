
#Set up the channel and get python
conda config --add channels conda-forge
conda update conda
conda create --name py310 
conda activate py310
conda init bash
conda install python=3.10

#Now for Torch. Make sure this works -- torchvision gives an error if you use 0.13 as of the time I write this.
#See available versions here: https://anaconda.org/conda-forge/pytorch-gpu/files
conda install -c conda-forge pytorch-gpu torchvision==0.12 

#General stuff
conda install pyyaml

#Cartopy and map stuff
conda install cartopy geons cairo pyyaml haversine netcdf4 
