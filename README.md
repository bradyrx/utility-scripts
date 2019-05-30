# utility-scripts
Generalized shell/python scripts for simple tasks on workstations.

# Dask Dashboard on PBS 

Currently, I use the following procedure:

1. Start an interactive job on Cheyenne.
2. Run `conda activate python3` or whatever environment I'm using.
3. Run `./pbs/dask_jlab.sh` which launches a job and spits out the proper SSH tunneling.
4. Execute the SSH command locally. Open notebook in `localhost:8888`. Once a queue of workers are ready, open the dashboard in `localhost:8787`.

```python
from dask_jobqueue import PBSCluster

cluster = PBSCluster() # config settings fill this in
cluster.start_workers(16)

from dask.distributed import Client
client = Client(cluster)
```
