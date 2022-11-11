
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
conda install pyyaml gitpython pandas pip pydeprecate lxml seaborn

#Cartopy and map stuff
conda install cartopy geos cairo haversine netcdf4 

#Flask
conda install -c anaconda flask 

#Other ML stuff
#This will probably install the CPU version of Tensorflow. But that's OK, I never use Tensorflow anyway. 
conda install scikit-image scikit-learn keras scipy tensorflow torchaudio tensorboard pytorch-lightning lightning-bolts cleanlab doubtlab 

#Dash
conda install dash plotly dash-bootstrap-components

#Other stuff
conda install rasterio osgeo numba jsonschema
