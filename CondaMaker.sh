conda config --add channels conda-forge
conda update conda
conda create --name py310 
conda actiavte py310
conda init bash
conda install python=3.10
conda install -c conda-forge pytorch-gpu==1.12.1 # see available versions here: https://anaconda.org/conda-forge/pytorch-gpu/files

